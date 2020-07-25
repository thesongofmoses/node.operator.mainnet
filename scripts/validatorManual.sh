#!/bin/bash

validator-query.boc=$(cd ~/ton-keys/elections && echo $(base64 --wrap=0 "validator-query.boc"))

cd ${TONOS_CLI_DIR} && ./tonos-cli call "$MY_RAW_ADDRESS" \
  submitTransaction "{"\"dest"\":"\"${ELECTOR_ADDRESS}"\","\"value"\":${1},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\"$validator-query.boc"\"}" \
  --abi $SAFEMULTISIGWALLET_ABI_JSON \
  --sign ${KEYS_DIR}/msig.keys.json \
  >> ${LOGS_DIR}/validator.log
