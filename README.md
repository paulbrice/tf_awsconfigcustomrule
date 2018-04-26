# tf_awsconfigcustomrule

A Terraform module to deploy an AWS Config Custom Rule and its associated Lambda Function and required IAM permissions.

### AWS Resources

- AWS Config Rule
- Lambda Function
- Lambda IAM Role
- Lambda IAM Policy

### Lambda Source Code

This module assumes your Lambda code will be placed in the Terraform root. Alter the lambda_source variable to dictate Lambda code source.

### Example

```
module "tf_awsconfigcustomrule_01" {
  source = "https://github.com/paulbrice/tf_awsconfigcustomrule"

  aws_region = "us-east-1"

  rule_name = "test-custom-rule-01"
  rule_description = "test config custom rule"
  custom_rule_resource_type = "AWS::EC2::Instance"
  lambda_source = "${path.module}/lambda01.py"
  lambda_package = "${path.module}/lambda01.zip"
  lambda_name = "lambda-custom-01"
  lambda_handler = "lambda01.lambda_handler"
  lambda_runtime = "python3.6"
  lambda_memory_size = "128"
  lambda_timeout = "300"
  lambda_description = "test lambda function"
}
```

### Lambda Configurations

https://docs.aws.amazon.com/lambda/latest/dg/resource-model.html
https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html

### To Do

Add a scheduled option to the config rule.
Lambda aliases for versioning
