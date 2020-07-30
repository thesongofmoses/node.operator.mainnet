#!/bin/bash

recover_query_boc=$(cd ${ELECTIONS_DIR} && echo $(base64 --wrap=0 "recover-query.boc"))
stake='1000000000'

cd ${TONOS_CLI_DIR} && \
./tonos-cli call "$MY_RAW_ADDRESS" submitTransaction \
        "{"\"dest"\":"\"${ELECTOR_ADDRESS}"\","\"value"\":"$stake","\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\"$recover_query_boc"\"}" \
        --abi ${SAFEMULTISIGWALLET_ABI_JSON} \
        --sign ${KEYS_DIR}/msig.keys.json
