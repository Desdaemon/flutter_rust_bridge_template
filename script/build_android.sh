#!/bin/bash

# You must have a define $ANDROID_NDK_HOME environment variable.

build() {
    echo "Building android libs"
    `cd native/ && cargo ndk -t armeabi-v7a -t arm64-v8a -o ../android/libs build && cd ..;`
}

build