#!/bin/bash

if [ "${1}" == '--help' ];
then
        echo 'Usage: tonosConfig <network_type>. ex) tonosConfig main'
        exit 0
fi

cd ${TONOS_CLI_DIR} && ./tonos-cli config --url https://"${1}".ton.dev --wc -1 && \
cp ${TONOS_CLI_DIR}/tonlabs-cli.conf.json ${SCRIPTS_DIR}/tonlabs-cli.conf.json
