#!/bin/bash

. ~/node.operator/configs/env.sh

check_status=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./checkAccount.sh ${2} | grep account | awk 'FNR == 3 {print $1}' | perl -ne '/state:\(account_(\S+)/ && print $1')

if [ "$check_status" == 'active' ];
then
cd ${TONOS_CLI_DIR} && \
./tonos-cli call ${1} \
        submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${TONOS_CLI_DIR}/${4}
else
cd ${TONOS_CLI_DIR} && \
./tonos-cli call ${1} \
        submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${TONOS_CLI_DIR}/${4}
fi
