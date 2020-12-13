

#!/bin/sh

set -x

docker-compose down -v
docker-compose build terraform
docker-compose run --rm wait-localstack
docker-compose run --rm terraform


cd lambdas 
zip -r handler.zip .

awslocal lambda create-function --function-name SQSTest --region eu-west-1 --runtime nodejs12.x --handler index.lambdaHandler --memory-size 128 --zip-file fileb://handler.zip --role arn:aws:iam::000000000000:role/irrelevant:role/irrelevant
awslocal lambda create-event-source-mapping --function-name SQSTest --event-source-arn arn:aws:sqs:elasticmq:000000000000:test-queue
