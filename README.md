# as-localstack

## startup localstack

```
./deploy.sh
```

### invoke lambda

```
awslocal lambda invoke --function-name queueSubscriber output.txt \
    --payload '{ "Records": [{ "messageId":"1", "body":"hello" }] }'
```

### publish to topic

```
awslocal sns publish --topic-arn "arn:aws:sns:eu-west-1:000000000000:local-test-sns" --message 'hello world'
```

### send message to SQS (triggers lambda)

```
awslocal sqs send-message --message-body="{}" --queue-url "http://localhost:4566/queue/local-test-queue"
```

### read SQS message

```
awslocal sqs receive-message --queue-url "http://localhost:4566/queue/local-test-queue"
```

### upload message item to dynamodb

```
awslocal dynamodb put-item \
 --table-name local-test-table \
 --item file://message.json \
 --return-consumed-capacity TOTAL \
 --return-item-collection-metrics SIZE
```

### scan dynamodb test table

```
awslocal dynamodb scan --table-name local-test-table
```
