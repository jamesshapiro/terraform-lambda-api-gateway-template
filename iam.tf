# ============= GET LAMBDA =============

resource "aws_iam_role" "get_lambda" {
  name = var.get_lambda_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "get_lambda" {
  name = var.get_lambda_name
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:GetItem"
      ],
      "Resource": [
        "${aws_dynamodb_table.this.arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "get_lambda" {
  name       = var.get_lambda_name
  roles      = ["${aws_iam_role.get_lambda.name}"]
  policy_arn = "${aws_iam_policy.get_lambda.arn}"
}

resource "aws_iam_role_policy_attachment" "get_lambda_logs" {
  role       = aws_iam_role.get_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


# ============= POST LAMBDA =============

resource "aws_iam_role" "post_lambda" {
  name = var.post_lambda_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "post_lambda" {
  name = var.post_lambda_name
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:UpdateItem",
        "dynamodb:GetItem"
        "dynamodb:Scan"
      ],
      "Resource": [
        "${aws_dynamodb_table.this.arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
          "lambda:InvokeFunction"
      ],
      "Resource": "${aws_lambda_function.post_lambda.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "post_lambda_logs" {
  role       = aws_iam_role.post_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "post_lambda" {
  role       = aws_iam_role.post_lambda.name
  policy_arn = aws_iam_policy.post_lambda.arn
}