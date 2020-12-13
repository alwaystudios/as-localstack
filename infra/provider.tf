provider "aws" {
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_force_path_style         = true
  access_key                  = "123"
  secret_key                  = "xyz"
  region                      = "eu-west-1"

  endpoints {
    lambda         = "http://localstack:4566"
    s3             = "http://localstack:4566"
    iam            = "http://localstack:4566"
    cloudwatch     = "http://localstack:4566"
    ec2            = "http://localstack:4566"
    stepfunctions  = "http://localstack:4566"
    cloudwatchlogs = "http://localstack:4566"
    sqs            = "http://localstack:4566"
    sns            = "http://localstack:4566"
    dynamodb       = "http://localstack:4566"
  }
}
