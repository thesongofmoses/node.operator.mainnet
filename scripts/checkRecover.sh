#!/bin/bash

cd ${NODE_OPERATOR_SCRIPTS_DIR}
./liteClient.sh \
        "runmethodfull ${ELECTOR_ADDRESS} compute_returned_stake $(printf "0x%s" $(echo $MY_RAW_ADDRESS | sed 's/^.\{3\}//'))" | awk 'FNR == 5 {print $3}'
