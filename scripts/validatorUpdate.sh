#!/bin/bash

pkill -f validator-engine
cd ~/main.ton.dev
git checkout master
git fetch --all --prune
git reset --hard origin/master
cd ~/main.ton.dev/scripts && ./build.sh
cd ~/main.ton.dev/ton
git rev-parse HEAD
head -n 2 /var/ton-work/node.log
rm -f /var/ton-work/etc/ton-global.config.json
cd /var/ton-work/etc/
wget https://raw.githubusercontent.com/tonlabs/main.ton.dev/master/configs/ton-global.config.json
cd ~/main.ton.dev/scripts && ./run.sh
