# as-localstack

## startup localstack

```
./deploy.sh
```

### invoke lambda

awslocal lambda invoke --function-name SQSTest output.txt

### send message to SQS (triggers lambda)

awslocal sqs send-message --message-body="{}" --queue-url "http://localhost:4566/queue/local-test-queue"

### read SQS message

awslocal sqs receive-message --queue-url "http://localhost:4566/queue/local-test-queue"
