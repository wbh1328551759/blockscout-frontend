#!/bin/bash

set -e

JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64"
JQ_TARGET="./jq"
curl -L $JQ_URL -o $JQ_TARGET
chmod +x $JQ_TARGET


# install_jq.sh
echo "PATH=\$PATH:$(pwd)" >> .env.secrets
