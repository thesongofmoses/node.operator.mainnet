#!/bin/bash

cd ${BUILD_DIR}
validator-engine-console/validator-engine-console \
        -k ${KEYS_DIR}/client \
        -p ${KEYS_DIR}/server.pub \
        -a 127.0.0.1:3030
