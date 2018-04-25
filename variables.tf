variable "aws_region" {
  description = "AWS region name"
}

variable "account_id" {
  default = ""
}
variable "account_short_name" {
    default = ""
}

variable "sns_topic_arn" {
    default = ""
}

variable "lambda_source" {
    default = ""

}
variable "lambda_package" {
    default = ""
}

variable "lambda_name" {
    default = ""
}
variable "rule_name" {
    default = ""
}
variable "rule_description" {
    default = ""
}
variable "lambda_package" {
    default = ""
}

variable "lambda_name" {
  default = ""
}

variable "lambda_handler" {
  default = ""
}

variable "lambda_runtime" {
  default = ""
}

variable "lambda_memory_size" {
  default = ""
}
variable "lambda_timeout" {
  default = ""
}

variable "lambda_description" {
  default = ""
}
