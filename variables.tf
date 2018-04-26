variable "aws_region" {
  description = "AWS region name"
}

variable "rule_name" {
  description = "aws config rule name"
}

variable "rule_description" {
  description = "aws config rule description"
}

variable "custom_rule_resource_type" {
  description = "aws config rule resource type"
}

variable "lambda_source" {
  description = "lambda code source path"

}
variable "lambda_package" {
  description = "lambda code package source path"
}

variable "lambda_name" {
  description = "lambda function name"
}

variable "lambda_description" {
  description = "lambda function description"
}

variable "lambda_handler" {
  description = "lambda function handler [file and initial function name for your code (file-name.function-name)]"
}

variable "lambda_runtime" {
  description = "lambda function runtime [python2.7,python3.6,nodejs4.3,nodejs6.10,nodejs8.10,java8,dotnetcore1.0,dotnetcore2.0]"
}

variable "lambda_memory_size" {
  description = "lambda function memory size limit [128 MB --> 3008 MB (with 64 MB increments)]"
}
variable "lambda_timeout" {
  description = "lambda function timeout [up to max 300 seconds]"
}
