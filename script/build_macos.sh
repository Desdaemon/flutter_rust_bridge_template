#!/bin/bash

build() {
    echo "Building macos libs"
    cd native
    `cargo build --target aarch64-apple-darwin --target x86_64-apple-darwin --release`
    lipo "target/aarch64-apple-darwin/release/libnative.a" "target/x86_64-apple-darwin/release/libnative.a" -output "../macos/libs/libnative.a" -create
}

build