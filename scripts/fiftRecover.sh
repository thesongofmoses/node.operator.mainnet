#!/bin/bash

#prepare recover-query-boc
cd ${NODE_OPERATOR_SCRIPTS_DIR}
./fift.sh recover-stake.fif

#prepare wallet address
my_parsed_raw_address=$(echo $MY_RAW_ADDRESS | sed 's/^.\{3\}//')
touch $my_parsed_raw_address > ${TVM_DIR}/$my_parsed_raw_address

#prepare key pair
cat ${KEYS_DIR}/msig.keys.json | awk 'FNR == 3 {print $2}' | tr -d '"\,\n' > ${TVM_DIR}/msig.keys.txt
cat ${KEYS_DIR}/msig.keys.json | awk 'FNR == 2 {print $2}' | tr -d '"\,\n' >> ${TVM_DIR}/msig.keys.txt
xxd -r -p ${TVM_DIR}/msig.keys.txt ${TVM_DIR}/msig.keys.bin

#prepare message
recover_query_boc=$(base64 --wrap=0 ${BUILD_DIR}/recover-query.boc)

cd ${TVM_DIR}
./tvm_linker message "${my_parsed_raw_address}" \
        -a "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        -m submitTransaction \
        -p "{"\"dest"\":"\"$ELECTOR_ADDRESS"\","\"value"\":1000000000,"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\"$recover_query_boc"\"}" \
        -w -1 \
        --setkey msig.keys.bin

#send message
first_six_characters=$(echo $my_parsed_raw_address | head -c8)
final_boc="$first_six_characters-msg-body.boc"

cd ${NODE_OPERATOR_SCRIPTS_DIR}
./liteClient.sh sendfile ${TVM_DIR}/$final_boc
