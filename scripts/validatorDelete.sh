#!/bin/bash

. ${NODE_OPERATOR_CONFIGS_DIR}/env.sh
permkey_hash=$(cat ${TON_WORK_DB_DIR}/config.json | jq -r ".validators[0].id" | base64 -d | xxd -p -c 64)
tempkey_hash=$(cat ${TON_WORK_DB_DIR}/config.json | jq -r ".validators[0].temp_keys[0].key" | base64 -d | xxd -p -c 64)
adnlkey_hash=$(cat ${TON_WORK_DB_DIR}/config.json | jq -r ".validators[0].adnl_addrs[0].id" | base64 -d | xxd -p -c 64)

cd ${NODE_OPERATOR_SCRIPTS_DIR}
./validatorConsole.sh &&
        printf "delvalidatoraddr $permkey_hash $adnlkey_hash" && \
        printf "deltempkey $permkey_hash $tempkey_hash"

killall -15 validator-engine
cut -d .validators[0] ${DB_DIR}/config.json

cd ${SCRIPTS_DIR}
  ./run.sh

rm ${ELECTIONS_DIR}/active-election-id
