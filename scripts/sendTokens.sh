#!/bin/bash

. ~/node.operator/configs/env.sh

if [ ${1} == "-h" ] || [ ${1} == '--help' ] && [ $# == 1 ];
then
  echo "Usage: sendTokens.sh <dest_addr> <value in ng> <id:-msig.keys.json>"
  exit 0
fi

id_raw_addr="$(cat ${KEYS_DIR}/${3}.addr)"
id_keys_json="${KEYS_DIR}/${3}.keys.json"

check_status=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./liteClient.sh getaccount ${1} | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//')

if [ "$check_status" == 'active' ] && [ $# == 2 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json

elif [ "$check_status" == 'active' ] && [ $# == 3 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call "${id_raw_addr}" \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign "${id_keys_json}"
elif [ "$check_status" != 'active' ] && [ $# == 2 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json

elif [ "$check_status" != 'active' ] && [ $# == 3 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call "${id_raw_addr}" \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign "${id_keys_json}"
else
echo "ERROR"

fi
