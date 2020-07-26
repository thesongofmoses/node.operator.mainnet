#!/bin/bash

cd ${TONOS_CLI_DIR} && \
./tonos-cli call ${1} \
        submitTransaction "{"\"dest"\":"\"${2}"\","\"value"\":${3},"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${TONOS_CLI_DIR}/${4}
