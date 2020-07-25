#!/bin/sh

#global parameters
p15=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && ./liteClient.sh getconfig 15)
p32=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && ./liteClient.sh getconfig 32)
p34=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && ./liteClient.sh getconfig 34)
p36=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && ./liteClient.sh getconfig 36)

#election variables
election_start_before=$(echo $p15 | awk 'FNR == 4 {print $5}' | tr -d 'elections_start_before:')
election_end_before=$(echo $p15 | awk 'FNR == 4 {print $6}' | tr -d 'elections_end_before:')
cycle_duration=$(echo $p15 | awk 'FNR == 4 {print $4}' | tr -d 'validators_elected_for:')

#validation cycle
previous_validation_cycle_since=$(expr $current_validation_cycle_since - $cycle_duration)
previous_validation_cycle_until=$(expr $current_validation_cycle_until - $cycle_duration)

current_validation_cycle_since=$(echo $p34 | grep time | awk '{print $2}' | tr -d 'utime_since:')
current_validation_cycle_until=$(echo $p34 | grep time | awk '{print $3}' | tr -d 'utime_until:')

next_validation_cycle_since=$(expr $current_validation_cycle_since + $cycle_duration)
next_validation_cycle_until=$(expr $current_validation_cycle_until + $cycle_duration)
