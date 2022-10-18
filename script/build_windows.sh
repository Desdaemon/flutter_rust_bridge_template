#!/bin/bash

# This script builds the native library for Android.
# You must have a define $ANDROID_NDK_HOME environment variable.

build() {
    echo "Building windows libs"
    cd native
    `cargo build --target x86_64-pc-windows-msvc --target aarch64-pc-windows-msvc --release`
    mv "target/x86_64-pc-windows-msvc/release/native.dll" "../windows/libs/x86_64-pc-windows-msvc/native.dll"
    mv "target/aarch64-pc-windows-msvc/release/native.dll" "../windows/libs/aarch64-pc-windows-msvc/natives.dll"
}

build