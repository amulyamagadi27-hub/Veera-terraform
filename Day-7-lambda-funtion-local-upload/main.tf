resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
  
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name #attaching policy to role 
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  filename      = "lambda_function.zip" #path to the zip file containing your lambda code

  source_code_hash = filebase64sha256("lambda_function.zip") #to ensure that the function is updated when the code changes

  #Without source_code_hash, Terraform might not detect when the code in the ZIP file has changed — meaning your Lambda might not update even after uploading a new ZIP.

#This hash is a checksum that triggers a deployment.
  
}
