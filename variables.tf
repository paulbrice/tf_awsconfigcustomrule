variable "aws_region" {
  description = "AWS region name"
}

variable "rule_name" {
    default = "aws config rule name"
}

variable "rule_description" {
    default = "aws config rule description"
}

variable "custom_rule_resource_type" {
  default = ""
}

variable "lambda_source" {
    default = "lambda code source path"

}
variable "lambda_package" {
    default = "lambda code package source path"
}

variable "lambda_name" {
    default = "lambda function name"
}

variable "lambda_description" {
  default = "lambda function description"
}

variable "lambda_handler" {
  default = "lambda function handler [file and initial function name for your code (file-name.function-name)]"
}

variable "lambda_runtime" {
  default = "lambda function runtime [python2.7,python3.6,nodejs4.3,nodejs6.10,nodejs8.10,java8,dotnetcore1.0,dotnetcore2.0]"
}

variable "lambda_memory_size" {
  default = "lambda function memory size limit [128 MB --> 3008 MB (with 64 MB increments)]"
}
variable "lambda_timeout" {
  default = "lambda function timeout [up to max 300 seconds]"
}
