import boto3
import json
import os
from datetime import datetime

ddb_client = boto3.client('dynamodb')
PK1 = 'RECORD#RECORD'
SK1_PREFIX = 'RECORD#'
TABLE_NAME = os.environ['TABLE_NAME']
field_name = 'FIELD'
now = None

def lambda_handler(event, context):
    global now
    now = datetime.now()
    body = {'hello': 'world!'}
    response = {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": "*"
        },
        "body": json.dumps(body)
    }
    return response
