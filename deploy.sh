

#!/bin/sh

set -x

rm output.txt
rm lambdas/*.zip

docker-compose down -v
docker-compose build terraform
docker-compose run --rm wait-localstack
docker-compose run --rm terraform


cd lambdas 
zip -r queueSubscriber.zip queueSubscriber.js

awslocal lambda create-function --function-name queueSubscriber --region eu-west-1 --runtime nodejs12.x --handler queueSubscriber.handler --memory-size 128 --zip-file fileb://queueSubscriber.zip --role arn:aws:iam::000000000000:role/irrelevant:role/irrelevant
awslocal lambda create-event-source-mapping --function-name queueSubscriber --event-source-arn arn:aws:sqs:eu-west-1:000000000000:local-test-queue
