#!/bin/sh
set -eou pipefail

# Create the deploy package directory if it doesn't exist
mkdir -p ${DEPLOY_PKG}

# Copy the index.js file to the deploy package directory
cp ${SRC_PKG}/tibuzin-main/functions/weather/index.js ${DEPLOY_PKG}
