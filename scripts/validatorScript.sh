#!/bin/bash

. ${NODE_OPERATOR_CONFIGS_DIR}/env.sh

nano_balance=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
        ./liteClient.sh "getaccount ${MY_RAW_ADDRESS}" | tail -n 1 | tr -d '=''ng' | awk '{print $4}')
fees_reserve='1000000000'
stake=$(echo $((($nano_balance-$fees_reserve)/1000000000)))

sleep_by='360'
sleep_delay='360'
sleep="$(($RANDOM% $sleep_by+$sleep_delay))"

check_election_status=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && \
        ./liteClient.sh "runmethodfull ${ELECTOR_ADDRESS} active_election_id" | awk 'FNR == 5 {print $3}')

if [ $check_election_status != 0 ];
then
        sleep $sleep && \
        cd ${SCRIPTS_DIR} && \
        ./validator_msig.sh $stake >> ${NODE_OPERATOR_LOGS_DIR}/validator.log
fi
