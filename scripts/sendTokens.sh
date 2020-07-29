#!/bin/bash

check_status_1=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./liteClient.sh getaccount ${1} | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//')

check_status_2=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./liteClient.sh getaccount ${2} | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//')

if [ "$check_status" == 'active' ];
then
        if [ $# == 2 ];
        then
        cd ${TONOS_CLI_DIR} && \
        ./tonos-cli call $MY_RAW_ADDRESS \
                submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
                --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
                --sign ${KEYS_DIR}/msig.keys.json

        elif [ $# == 3 ];
        then
        cd ${TONOS_CLI_DIR} && \
        ./tonos-cli call ${1:-MY_RAW_ADDRESS} \
                submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
                --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
                --sign ${KEYS_DIR}/msig.keys.json
        fi
else
        if [ $# == 2 ];
        then
        cd ${TONOS_CLI_DIR} && \
        ./tonos-cli call $MY_RAW_ADDRESS \
                submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
                --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
                --sign ${KEYS_DIR}/msig.keys.json

        elif [ $# == 3 ];
        then
        cd ${TONOS_CLI_DIR} && \
        ./tonos-cli call ${1:-MY_RAW_ADDRESS} \
                submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
                --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
                --sign ${KEYS_DIR}/msig.keys.json
        fi
fi
