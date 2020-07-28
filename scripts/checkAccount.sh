#!/bin/bash

cd ${NODE_OPERATOR_SCRIPTS_DIR}
./liteClient.sh getaccount ${1:-$MY_RAW_ADDRESS}
