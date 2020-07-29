#!/bin/bash

check_status=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./checkAccount.sh ${1} | grep account | awk 'FNR == 3 {print $1}' | perl -ne '/state:\(account_(\S+)/ && print $1')


if [ "$check_status" == 'active' ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json
else
cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json
fi
