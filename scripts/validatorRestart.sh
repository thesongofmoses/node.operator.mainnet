#!/bin/bash

CHECK_ENGINE=$(pgrep -f '/main.ton.dev/ton/build/validator-engine/validator-engine -C /var/ton-work/etc/ton-global.config.json --db /var/ton-work/db')
PRINT_UNIXTIME=$(date +%s)

function RESTART () {
        printf '%u\n' "$PRINT_UNIXTIME" && \
        cd ~/main.ton.dev/scripts/ && \
        ./run.sh
}


if [ -z "$CHECK_ENGINE" ]; then
        RESTART >> ~/node.operator/logs/restart.log
fi
