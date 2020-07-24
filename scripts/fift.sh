#!/bin/bash

NODE_OPERATOR_CONFIGS_DIR="~/node.operator/configs"
. "${NODE_OPERATOR_CONFIGS_DIR}/env.sh"

cd ${BUILD_DIR}
crypto/fift -I/home/$USERNAME/${TON_DIR}/crypto/fift/lib \
-s ${TON_DIR}/crypto/smartcont/${1}
