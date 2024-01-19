#!/bin/bash

# download assets for the running instance
dotenv \
  -e .env.production \
  -- bash -c './deploy/scripts/download_assets.sh ./public/assets'

yarn svg:build-sprite
echo ""

echo 'tags: ' $(git describe --tags --abbrev=0)
# generate envs.js file and run the app
dotenv \
  -v NEXT_PUBLIC_GIT_COMMIT_SHA=$(git rev-parse --short HEAD) \
  -v NEXT_PUBLIC_GIT_TAG=$(git describe --tags --always) \
  -e .env.secrets \
  -e .env.production \
  -- bash -c './deploy/scripts/make_envs_script.sh && next build' |
pino-pretty
