# Create the DynamoDB table
resource "aws_dynamodb_table" "this" {
  name           = var.app_name
  billing_mode   = "PAY_PER_REQUEST"

  hash_key       = "PK1"
  range_key      = "SK1"
  attribute {
    name = "PK1"
    type = "S"
  }
  attribute {
    name = "SK1"
    type = "S"
  }
}