#!/bin/bash

# This script builds the native library for Android.
# You must have a define $ANDROID_NDK_HOME environment variable.
LIBNAME="native"

build() {
    echo "Building android libs"
    
    cd native
    rustup target add armeabi-v7a arm64-v8a
    cargo ndk -t armeabi-v7a -t arm64-v8a -o "../android/libs" build --release
}


build