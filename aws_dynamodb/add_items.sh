#!/bin/sh
aws dynamodb batch-write-item --endpoint-url $DDB_ENDPOINT_URL ＼
--request-items file://items.json ＼
--return-item-collection-metrics SIZE