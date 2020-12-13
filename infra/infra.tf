resource "aws_s3_bucket" "test_bucket" {
  bucket = "${var.env}-test-bucket"
}

resource "aws_sns_topic" "test_sns" {
  name = "${var.env}-test-sns"
}

resource "aws_sqs_queue" "test_queue" {
	name = "${var.env}-test-queue"
}

resource "aws_sns_topic_subscription" "test_sns_sqs1_target" {
    topic_arn = "${aws_sns_topic.test_sns.arn}"
    protocol  = "sqs"
    endpoint  = "${aws_sqs_queue.test_queue.arn}"
}

resource "aws_dynamodb_table" "test-table" {
  name              = "${var.env}-test-table"
  read_capacity     = 5
  write_capacity    = 5
  hash_key          = "id"
  range_key         = "message"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "message"
    type = "S"
  }
}
