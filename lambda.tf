# GET Lambda endpoint
# ============================================================
resource "aws_lambda_function" "get_lambda" {
  filename         = data.archive_file.function-zip.output_path
  source_code_hash = data.archive_file.function-zip.output_base64sha256
  function_name    = var.get_lambda_name
  role             = "${aws_iam_role.get_lambda.arn}"
  handler          = "get_lambda.lambda_handler"
  runtime          = "python3.10"
  timeout          = 60

  environment {
    variables = {
      "TABLE_NAME" = "${aws_dynamodb_table.this.name}"
    }
  }
}

# POST Lambda endpoint
# ============================================================
resource "aws_lambda_function" "post_lambda" {
  filename         = data.archive_file.function-zip.output_path
  source_code_hash = data.archive_file.function-zip.output_base64sha256
  function_name    = var.post_lambda_name
  role             = "${aws_iam_role.post_lambda.arn}"
  handler          = "post_lambda.lambda_handler"
  runtime          = "python3.10"
  timeout          = 60

  environment {
    variables = {
      "TABLE_NAME" = "${aws_dynamodb_table.this.name}"
    }
  }
}

# Create the data source that generates the function.zip file
# ============================================================
data "archive_file" "function-zip" {
  type        = "zip"
  source_dir  = "function-code"
  output_path = "function.zip"
}