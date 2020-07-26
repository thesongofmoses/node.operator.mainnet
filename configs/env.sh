#!/bin/bash

if [ "$DEBUG" = "yes" ]
then
    set -x
fi

export NETWORK=${1}
HOSTNAME=$(hostname -s)
export HOSTNAME
USERNAME=$(whoami)
export USERNAME


#MY ACCOUNT
export MY_RAW_ADDRESS="$(cat ${KEYS_DIR}/$HOSTNAME.addr)"
export SAFEMULTISIGWALLET_ABI_JSON="${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json"
export SAFEMULTISIGWALLET_TVC="${SAFEMULTISIG_DIR}/SafeMultisigWallet.tvc"

#DIRs
##x.ton.dev
export DEV_DIR="$HOME/${NETWORK}.ton.dev"
export TON_DIR="${DEV_DIR}/ton"
export BUILD_DIR="${TON_DIR}/build"
export SCRIPTS_DIR="${DEV_DIR}/scripts"
export UTILS_DIR="${TON_BUILD_DIR}/utils"
export CONFIGS_DIR="${DEV_DIR}/configs"

##ton-keys
export KEYS_DIR="$HOME/ton-keys"
export ELECTIONS_DIR="${KEYS_DIR}/elections"

##smart-contracts
export SOLIDITY_DIR="${DEV_DIR}/ton-labs-contracts/solidity"
export SETCODEMULTISIG_DIR="${SOLIDITY_DIR}/setcodemultisig"
export SAFEMULTISIG_DIR="${SOLIDITY_DIR}/safemultisig"

##tonos-cli
export TONOS_CLI_DIR="${DEV_DIR}/tonos-cli/target/release"

##ton-work
export TON_WORK_DIR="/var/ton-work"
export TON_WORK_DB_DIR="${TON_WORK_DIR}/db"
export TON_WORK_DB_KEYRING_DIR="${TON_WORK_DB_DIR}/keyring"

##tvm
export TVM_DIR="$HOME/TVM-linker/tvm_linker/target/release"

##node.operator
export NODE_OPERATOR_DIR="$HOME/node.operator"
export NODE_OPERATOR_SCRIPTS_DIR="${NODE_OPERATOR_DIR}/scripts"
export NODE_OPERATOR_CONFIGS_DIR="${NODE_OPERATOR_DIR}/configs"
export NODE_OPERATOR_LOGS_DIR="${NODE_OPERATOR_DIR}/logs"
export NODE_OPERATOR_MONITOR_DIR="${NODE_OPERATOR_DIR}/monitor"


#VALIDATION GLOBAL PARAMETERS
##parameters
P1=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && ./liteClient.sh getconfig 1)
P15=$(cd ${NODE_OPERATOR_SCRIPTS_DIR} && ./liteClient.sh getconfig 15)

##election variables
CYCLE_DURATION=$(echo $P15 | awk 'FNR == 4 {print $4}' | tr -d 'validators_elected_for:')
export CYCLE_DURATION
ELECTION_START_BEFORE=$(echo $P15 | awk 'FNR == 4 {print $5}' | tr -d 'elections_start_before:')
export ELECTION_START_BEFORE
ELECTION_END_BEFORE=$(echo $P15 | awk 'FNR == 4 {print $6}' | tr -d 'elections_end_before:')
export ELECTION_END_BEFORE
STAKES_HELD_FOR=$(echo $P15 | awk 'FNR == 4 {print $7}' | tr -d 'stakes_held_for:\)')
export STAKES_HELD_FOR

RAW_ELECTOR_ADDRESS=$(echo $P1 | sed -n 4p | awk '{print $4}' | tr -d 'elector_addr:x\)')
ELECTOR_ADDRESS=$(printf "-1:%s" RAW_ELECTOR_ADDRESS)
export ELECTOR_ADDRESS
