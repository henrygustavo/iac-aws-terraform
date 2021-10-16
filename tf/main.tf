provider "aws" {
  region                      = "us-west-1"
  access_key                  = "anaccesskey"
  secret_key                  = "asecretkey"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  skip_requesting_account_id  = true

  endpoints {
    s3             = "http://aws-localstack:4566"
    sns            = "http://aws-localstack:4566"
    sqs            = "http://aws-localstack:4566"
    dynamodb       = "http://aws-localstack:4566"
  }
}

resource "aws_dynamodb_table" "system-db" {
  name           = "system-database"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"
  range_key      = "Version"

  attribute {
    name = "Id"
    type = "S"
  }

  attribute {
    name = "Version"
    type = "N"
  }
}
