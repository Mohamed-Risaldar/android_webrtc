#!/bin/bash

set -e

VERSION=1.0.1

RELEASE_VERSION=${VERSION}

SDK_BIN_URL=https://github.com/Mohamed-Risaldar/android_webrtc/releases/download/${VERSION}/libwebrtc.aar

BUILD_DIR=build
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

echo "Downloading webrtc-sdk ${VERSION} binary for android."
curl -L -O ${SDK_BIN_URL}

mvn install:install-file \
    -Dfile=libwebrtc.aar \
    -Dpackaging=aar \
    -Dversion=${RELEASE_VERSION} \
    -DgroupId=com.github.Mohamed-Risaldar \
    -DartifactId=android_webrtc
