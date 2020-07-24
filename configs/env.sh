#!/bin/bash

if [ "$DEBUG" = "yes" ]
then
    set -x
fi

export NETWORK="main"
HOSTNAME=$(hostname -s)
export HOSTNAME
USERNAME=$(whoami)
export USERNAME

#CONSTANT VARIABLES
export MY_RAW_ADDRESS="$(cat ${KEYS_DIR}/$HOSTNAME.addr)"

#DIRs
##x.ton.dev
export DEV_DIR="${NETWORK}.ton.dev"
export TON_DIR="${DEV_DIR}/ton"
export BUILD_DIR="${TON_DIR}/build"
export SCRIPTS_DIR="${DEV_DIR}/scripts"
export UTILS_DIR="${TON_BUILD_DIR}/utils"
export CONFIGS_DIR="${DEV_DIR}/configs"

##ton-keys
export KEYS_DIR="$HOME/ton-keys"
export ELECTIONS_DIR="${KEYS_DIR}/elections"

##ton-work
export TON_WORK_DIR="/var/ton-work"
export TON_WORK_DB_DIR="${TON_WORK_DIR}/db"
export TON_WORK_DB_KEYRING_DIR="${TON_WORK_DB_DIR}/keyring"

##smart-contracts
export SOLIDITY_DIR="${DEV_DIR}/ton-labs-contracts/solidity"
export SETCODEMULTISIG_DIR="${SOLIDITY_DIR}/setcodemultisig"
export SAFEMULTISIG_DIR="${SOLIDITY_DIR}/safemultisig"

#TONOS-CLI
export TONOS_CLI_DIR="${DEV_DIR}/tonos-cli/target/release"

#TVM
export TVM_DIR="$HOME/TVM-linker/tvm_linker/target/release"

#NODE.OPERATOR
export NODE_OPERATOR_DIR="$HOME/node.operator"
export NODE_OPERATOR_SCRIPTS_DIR="${NODE_OPERATOR_DIR}/scripts"
export NODE_OPERATOR_CONFIGS_DIR="${NODE_OPERATOR_DIR}/configs"
