#!/bin/bash

# This script builds the native library for Android.
# You must have a define $ANDROID_NDK_HOME environment variable.

build() {
    echo "Building macos libs"
    cd native
    `cargo build --target aarch64-apple-darwin --target x86_64-apple-darwin --target aarch64-apple-ios-sim --release`
    lipo "target/aarch64-apple-darwin/release/libnative.a" "target/x86_64-apple-darwin/release/libnative.a" -output "../macos/libs/libnative.a" -create
}

build