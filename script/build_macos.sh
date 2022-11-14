#!/bin/bash

LIBNAME="native"

build() {
    echo "Building macos libs"
    cd native
    `cargo build --target aarch64-apple-darwin --target x86_64-apple-darwin --target aarch64-apple-ios-sim --release`
    lipo "target/aarch64-apple-darwin/release/lib$LIBNAME.dylib" "target/x86_64-apple-darwin/release/lib$LIBNAME.dylib" -output "../macos/libs/lib$LIBNAME.dylib" -create
}

build