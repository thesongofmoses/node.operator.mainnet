#!/bin/bash

pkill -f validator-engine
cd ~/main.ton.dev
git checkout master
git fetch --all --prune
git reset --hard origin/master
cd ~/main.ton.dev/scripts && ./build.sh
cd ~/main.ton.dev/tonos-cli/target/release/ && ./tonos-cli config --url https://main.ton.dev --wc -1
cp ~/main.ton.dev/tonos-cli/target/release/tonlabs-cli.conf.json ~/main.ton.dev/scripts/tonlabs-cli.conf.json 
rm validator_msig.sh && \
wget https://raw.githubusercontent.com/tonlabs/net.ton.dev/master/scripts/validator_msig.sh && \
chmod +x validator_msig.sh
rm -f /var/ton-work/etc/ton-global.config.json && \
cd /var/ton-work/etc/ && \
wget https://raw.githubusercontent.com/tonlabs/main.ton.dev/master/configs/ton-global.config.json && \
cd ~/main.ton.dev/scripts && ./run.sh
cd ~/main.ton.dev/ton && \
git rev-parse HEAD && head -n 2 /var/ton-work/node.log
