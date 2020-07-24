#!/bin/bash

sudo apt install git
git clone https://github.com/tonlabs/main.ton.dev.git
cd ~/main.ton.dev/scripts/
. ./env.sh
./build.sh
./setup.sh
./run.sh
