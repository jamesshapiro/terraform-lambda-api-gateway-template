import boto3
import os
import json

dynamodb_client = boto3.client('dynamodb')
table_name = os.environ['TABLE_NAME']

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'headers': {
            "Access-Control-Allow-Origin": "*"
        },
        'body': 'Success!'
    }