#!/bin/bash

rm "${1}.txt"

input="${1}.csv"
while IFS=',' read -r address tokens
do
        echo "$address $tokens" >> "${1}.txt"
done < "$input"

rm "${1}_status.txt"

for i in {2..5}
do

cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
./liteClient.sh getaccount $(cat "${1}.txt" | awk "FNR == ${i}" | awk '{print $1}') | awk 'FNR == 19 {print $1}' | sed 's/^.\{15\}//' >> "${1}_status.txt"
