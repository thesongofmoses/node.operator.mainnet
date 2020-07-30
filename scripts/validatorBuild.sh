#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

#install dependencies
sudo apt install bc -y

#set env
cd ${NODE_OPERATOR_SCRIPTS_DIR} && . ${NODE_OPERATOR_CONFIGS_DIR}/env.sh

#install node
cd && git clone https://github.com/tonlabs/${1}.ton.dev.git
cd ${SCRIPTS_DIR}
. ./env.sh
./build.sh
./setup.sh
./run.sh

#install TVM
cd && git clone https://github.com/tonlabs/TVM-linker.git
cd TVM-linker/tvm_linker
cargo build --release
