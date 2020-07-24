#!/bin/bash

cd ${BUILD_DIR}
crypto/fift -I/home/$USERNAME/net.ton.dev/ton/crypto/fift/lib \
-s ${TON_DIR}/crypto/smartcont/${1}
