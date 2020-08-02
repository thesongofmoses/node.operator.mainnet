#!/bin/bash

if [ "$DEBUG" = "yes" ]
then
    set -x
fi

export NETWORK=main
HOSTNAME=$(hostname -s)
export HOSTNAME
USERNAME=$(whoami)
export USERNAME

#IP and ports
MY_PUBLIC_IP=$(curl -sS ipv4bot.whatismyipaddress.com)
export MY_PUBLIC_IP
export ADNL_PORT="30310"
export LITESERVER_IP="127.0.0.1"
export LITESERVER_PORT="3031"

#MY ACCOUNT
export MY_RAW_ADDRESS="$(cat ${KEYS_DIR}/$HOSTNAME.addr)"
export SAFEMULTISIGWALLET_ABI_JSON="${SAFEMULTISIG_DIR}/SafeMultisigWallet.abi.json"
export SAFEMULTISIGWALLET_TVC="${SAFEMULTISIG_DIR}/SafeMultisigWallet.tvc"

#DIRs
##x.ton.dev
export SRC_DIR="$HOME/main.ton.dev"
export TON_DIR="${SRC_DIR}/ton"
export BUILD_DIR="${TON_DIR}/build"
export SCRIPTS_DIR="${DEV_DIR}/scripts"
export UTILS_DIR="${BUILD_DIR}/utils"
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

##tvm
export TVM_DIR="$HOME/TVM-linker/tvm_linker/target/release"

##node.operator
export NODE_OPERATOR_DIR="$HOME/node.operator"

#GLOBAL PARAMETERS
export ELECTOR_ADDRESS=$(cat ${ELECTIONS_DIR}/elector-addr-base64)
