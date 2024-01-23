#!/bin/bash

set -e

JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64"
JQ_TARGET="./jq"
curl -L $JQ_URL -o $JQ_TARGET
chmod +x $JQ_TARGET

echo "jq installed at $(pwd)/jq"

echo "PATH=\$PATH:$(pwd)" >> .env.secrets

echo "PATH updated in .env.secrets: $(cat .env.secrets)"
