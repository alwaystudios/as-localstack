const AWS = require("aws-sdk");

let response;

const client = new AWS.DynamoDB.DocumentClient({
  region: "eu-west-1",
  endpoint: `http://${process.env.LOCALSTACK_HOSTNAME}:4566`,
});

exports.handler = async (event, context) => {
  try {
    for (const { messageId, body } of event.Records) {
      const id = messageId;
      const message = body;
      const TableName = "local-test-table";
      await client.put({ TableName, Item: { id, message } }).promise();
    }

    response = {
      statusCode: 200,
      body: { endpoint: `http://${process.env.LOCALSTACK_HOSTNAME}:4566` },
    };
  } catch (err) {
    console.log(err);
    return err;
  }

  return response;
};
