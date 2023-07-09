variable "app_name" {
    description = "Name of the application"
    type        = string
    default     = "tf-api-demo"
}

variable "get_lambda_name" {
  description = "Name of the GET lambda"
  type        = string
  default     = "get-lambda"
}

variable "post_lambda_name" {
  description = "Name of the POST lambda"
  type        = string
  default     = "post-lambda"
}

variable "region_name" {
    description = "Deployment region"
    type        = string
    default     = "us-east-1"
}

variable "api_stage_name" {
    description = "API Stage Name"
    type        = string
    default     = "dev"
}



# variable "account_id" {
#     description = "Account ID"
#     type        = string
# }