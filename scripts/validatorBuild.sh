#!/bin/bash

SCRIPTS_DIR='$HOME/main.ton.dev/scripts'

sudo apt install -y git
cd
git clone https://github.com/tonlabs/${NETWORK}.ton.dev.git

cd ${SCRIPTS_DIR}
. ./env.sh
./build.sh
./setup.sh
./run.sh

cd
git clone https://github.com/tonlabs/TVM-linker.git
cd TVM-linker/tvm_linker
cargo build --release
