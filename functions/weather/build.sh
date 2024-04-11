#!/bin/sh
set -eou pipefail

# Create the deploy package directory if it doesn't exist
mkdir -p ${DEPLOY_PKG}

cd ${SRC_PKG}/tibuzin-main/functions/weather

npm install axios

# Copy the index.js file to the deploy package directory
cp ${SRC_PKG}/tibuzin-main/functions/weather/index.js ${DEPLOY_PKG}
cp -R ${SRC_PKG}/tibuzin-main/functions/weather/node_modules ${DEPLOY_PKG}