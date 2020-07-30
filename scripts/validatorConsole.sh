#!/bin/bash

cd ${BUILD_DIR}
validator-engine-console/validator-engine-console \
        -k ${KEYS_DIR}/client \
        -p ${KEYS_DIR}/server.pub \
        -a ${LITESERVER_IP}:${LITESERVER_PORT}
