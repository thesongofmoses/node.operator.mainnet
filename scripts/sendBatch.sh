#!/bin/bash

. ~/node.operator/configs/env.sh

rm "${1}.txt"
input="${1}.csv"
while IFS=',' read -r address tokens
do
        echo "$address $tokens" >> "${1}.txt"
done < "$input"


rm "${1}_status.txt"
for i in {1..5}
do
        cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
        ./liteClient.sh getaccount $(cat "${NODE_OPERATOR_SCRIPTS_DIR}/${1}.txt" | awk "FNR == ${i}" | awk '{print $1}') | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//' | awk '{print} END {if (!NR) print "empty"}' >> "${1}_status.txt"
done

for i in {1..5}
do

if [ "$(cat ${NODE_OPERATOR_SCRIPTS_DIR}/${1}_status.txt | awk "\"FNR == ${i}"\")" == 'active' ];
then

cd ${TONOS_CLI_DIR} && \
./tonos-cli call "$(cat ${KEYS_DIR}/${2}.addr)" \
        submitTransaction "{"\"dest"\":"\"$(cat "${NODE_OPERATOR_SCRIPTS_DIR}/${1}.txt" | awk "FNR == ${i}" | awk '{print $1}')"\","\"value"\":$(cat "${NODE_OPERATOR_SCRIPTS_DIR}/${1}.txt" | awk "FNR == ${i}" | awk '{print $2}'),"\"bounce"\":true,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/"${2}.keys.json"

elif [ "$(cat ${NODE_OPERATOR_SCRIPTS_DIR}/${1}_status.txt | awk "\"FNR == ${i}"\")" != 'active' ];
then

cd ${TONOS_CLI_DIR} && \
./tonos-cli call "$(cat ${KEYS_DIR}/${2}.addr)" \
        submitTransaction "{"\"dest"\":"\"$(cat "${NODE_OPERATOR_SCRIPTS_DIR}/${1}.txt" | awk "FNR == ${i}" | awk '{print $1}')"\","\"value"\":$(cat "${NODE_OPERATOR_SCRIPTS_DIR}/${1}.txt" | awk "FNR == ${i}" | awk '{print $2}'),"\"bounce"\":false,"\"allBalance"\":false,"\"payload"\":"\""\"}" \
        --abi "${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json" \
        --sign ${KEYS_DIR}/"${2}.keys.json"

fi
done
