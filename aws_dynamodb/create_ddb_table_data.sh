#!/bin/sh
export DDB_ENDPOINT_URL=http://localhost:8000
cd awscli/
./create_ddb_table.sh
sleep 2
./add_items.sh