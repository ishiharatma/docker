#!/bin/sh
aws dynamodb create-table --endpoint-url $DDB_ENDPOINT_URL ＼
--table-name Items ＼
--attribute-definitions ＼
AttributeName=id,AttributeType=S ＼
--key-schema ＼
AttributeName=id,KeyType=HASH ＼
--billing-mode=PAY_PER_REQUEST