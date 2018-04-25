# template file for config role trust
data "template_file" "lambda_role_trust_policy_tpl" {
  template = "${file("${path.module}/policies/lambda-role-trust-policy.tpl")}"
}

# template file for config role policy
data "template_file" "lambda_role_policy_tpl" {
  template = "${file("${path.module}/policies/lambda-role-policy.tpl")}"
}

#lambda package
data "archive_file" "lambda_package" {
  type        = "zip"
  source_file = "${var.lambda_source}"
  output_path = "${var.lambda_package}"
}

#lambda iam role
resource "aws_iam_role" "lambda_role" {
  name               = "${var.account_short_name}-${var.lambda_name}-role"
  assume_role_policy = "${data.template_file.lambda_role_trust_policy_tpl.rendered}"
}

#lambda policy
resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.account_short_name}-${var.lambda_name}-policy"
  role = "${aws_iam_role.lambda_role.id}"

  policy = "${data.template_file.lambda_role_policy_tpl.rendered}"
}

#lambda policy attach to role
resource "aws_iam_role_policy_attachment" "lambda_role_policy_attach" {
  role       = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.lambda_policy.arn}"
}

#config custom rule
resource "aws_config_config_rule" "custom_rule" {
  name             = "${var.rule_name}"
  description      = "${var.rule_description}"
  input_parameters = "{}"

  scope {
    compliance_resource_types = ["${custom_rule_resource_type}"]
  }

  source {
    owner             = "CUSTOM_LAMBDA"
    source_identifier = "${aws_lambda_function.lambda.arn}"

    source_detail {
      event_source = "aws.config"
      message_type = "ConfigurationItemChangeNotification"
    }
  }
}

#lambda function
resource "aws_lambda_function" "lambda_function" {
  depends_on = ["data.archive_file.lambda_package"]
  filename      = "${var.lambda_package}"
  function_name = "${var.lambda_name}"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "${var.lambda_handler}"
  source_code_hash = "${data.archive_file.lambda_package.output_base64sha256}"
  runtime       = "${var.lambda_runtime}"
  memory_size   = "${var.lambda_memory_size}"
  timeout       = "${var.lambda_timeout}"
  description   = "${var.lambda_description}"
  publish = true
}

#lambda function trigger permisions
resource "aws_lambda_permission" "lambda_01_permisions" {
  statement_id   = "AllowExecuteFromConfig"
  action         = "lambda:InvokeFunction"
  function_name  = "${aws_lambda_function.lambda_01.function_name}"
  principal      = "config.amazonaws.com"
  source_account = "${var.accountid}"
}
