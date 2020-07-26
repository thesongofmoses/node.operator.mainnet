#!/bin/bash

cd ${TONOS_CLI_DIR} && \
./tonos-cli call $MY_RAW_ADDRESS \
        submitTransaction "{"\"dest"\":"\"${1}"\","\"value"\":${2},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/msig.keys.json
