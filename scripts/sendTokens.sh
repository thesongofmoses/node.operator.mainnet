#!/bin/bash

if [ ${1} == "-h" ] || [ ${1} == '--help' ] && [ $# == 1 ];
then
  echo "Usage: sendTokens.sh <sending addr:-my_raw_addr> <dest_addr> <value in ng> <sign:-msig.keys.json>"
  exit 0
fi

check_status_one=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./liteClient.sh getaccount ${1} | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//')

check_status_two=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./liteClient.sh getaccount ${2} | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//')

if [ "$check_status_one" == 'active' ] && [ $# == 2 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json

elif [ "$check_status_two" == 'active' ] && [ $# == 4 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call ${1} \
        submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/${4}
elif [ "$check_status_one" != 'active' ] && [ $# == 2 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json

elif [ "$check_status_two" != 'active' ] && [ $# == 4 ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call ${1} \
        submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/${4}
else
echo "ERROR"

fi
