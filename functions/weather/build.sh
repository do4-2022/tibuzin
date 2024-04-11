#!/bin/sh
set -eou pipefail

# Create the deploy package directory if it doesn't exist
mkdir -p ${DEPLOY_PKG}

# Move to the folder
cd ${SRC_PKG}/tibuzin-main/functions/weather

# Install axios
npm install axios

# Copy the index.js file to the deploy package directory
cp ${SRC_PKG}/tibuzin-main/functions/weather/index.js ${DEPLOY_PKG}
# Copy the index.js file and node_modules to the deploy package directory
cp -R ${SRC_PKG}/tibuzin-main/functions/weather/node_modules ${DEPLOY_PKG}