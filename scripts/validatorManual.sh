#!/bin/bash

validator_query_boc=$(echo $(base64 --wrap=0 ${ELECTIONS_DIR}/'validator-query.boc'))

cd ${TONOS_CLI_DIR} && ./tonos-cli call "$MY_RAW_ADDRESS" \
  submitTransaction "{"\"dest"\":"\"${ELECTOR_ADDRESS}"\","\"value"\":${1},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\"$validator_query_boc"\"}" \
  --abi $SAFEMULTISIGWALLET_ABI_JSON \
  --sign ${KEYS_DIR}/msig.keys.json \
