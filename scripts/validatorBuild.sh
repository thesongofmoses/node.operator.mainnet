#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

NODE_OPERATOR_SCRIPTS_DIR='$HOME/node.operator/scripts'
NODE_OPERATOR_CONFIGS_DIR='$HOME/node.operator/configs'

#install dependencies
sudo apt install bc -y
mv node.operator.mainnet node.operator
cd ${NODE_OPERATOR_SCRIPTS_DIR} && . ${NODE_OPERATOR_CONFIGS_DIR}/env.sh ${1}
chmod +x -R ${NODE_OPERATOR_SCRIPTS_DIR}
cd ${NODE_OPERATOR_CONFIGS_DIR}
    cat bashrc > ~/.bashrc && source ~/.bashrc
    crontab ~/node.operator/configs/crontab

#install node
cd && git clone https://github.com/tonlabs/${1}.ton.dev.git
cd ${SCRIPTS_DIR}
. ./env.sh
./build.sh
./setup.sh
./run.sh

cd && git clone https://github.com/tonlabs/TVM-linker.git
cd TVM-linker/tvm_linker
cargo build --release
