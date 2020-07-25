#!/bin/bash

sudo apt install -y git
cd && git clone https://github.com/tonlabs/${NETWORK}.ton.dev.git
cd ${SCRIPTS_DIR}
. ./env.sh
./build.sh
./setup.sh
./run.sh

cd && git clone https://github.com/tonlabs/TVM-linker.git
cd ${TVM_DIR}
cargo build --release
