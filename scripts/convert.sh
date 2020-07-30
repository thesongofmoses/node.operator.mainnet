#!/bin/bash

permkey=$(cat ${TON_WORK_DB_DIR}/config.json | jq -r ".validators[0].id" | base64 -d | xxd -p -c 64)
tempkey=$(cat ${TON_WORK_DB_DIR}/config.json | jq -r ".validators[0].temp_keys[0].key" | base64 -d | xxd -p -c 64)
adnl_addrs=$(cat ${TON_WORK_DB_DIR}/db/config.json | jq -r ".validators[0].adnl_addrs[0].id" | base64 -d | xxd -p -c 64)

echo $permkey
echo $tempkey
echo $adnl_addrs

