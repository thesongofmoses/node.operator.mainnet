#!/bin/bash

${BUILD_DIR}/lite-client/lite-client \
  -p ~/ton-keys/liteserver.pub \
  -a 127.0.0.1:3031 \
  -rc \
  "${1} ${2} ${3} ${4}"
  -rc 'quit' 2>/dev/null
