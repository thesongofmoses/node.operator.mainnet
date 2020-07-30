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

sudo mkdir -p "${KEYS_DIR}"
chmod 700 "${KEYS_DIR}"
"${UTILS_DIR}/generate-random-id" -m keys -n server > "${KEYS_DIR}/keys_server"
"${UTILS_DIR}/generate-random-id" -m keys -n liteserver > "${KEYS_DIR}/keys_liteserver"
"${UTILS_DIR}/generate-random-id" -m keys -n client > "${KEYS_DIR}/keys_client"
