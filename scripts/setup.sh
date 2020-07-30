#!/bin/bash

. ${NODE_OPERATOR_DIR}/configs/env.sh

sudo rm -rf "${TON_WORK_DIR}"
sudo mkdir -p "${TON_WORK_DIR}"
mkdir -p "${TON_WORK_DIR}/etc"
mkdir -p "${TON_WORK_DIR}/db"

sudo cp "${CONFIGS_DIR}/ton-global.config.json" "${TON_WORK_DIR}/etc/ton-global.config.json"

sudo chmod 700 ${TON_WORK_DIR}
sudo chmod 700 ${TON_WORK_DIR}/db
sudo chmod 700 ${TON_WORK_DIR}/etc

cd "${BUILD_DIR}"
validator-engine/validator-engine \
  -C ${TON_WORK_DIR}
  --db "${TON_WORK_DIR}/db"
  --ip "${LITESERVER_IP}":"${LITESERVER_PORT}"


 
