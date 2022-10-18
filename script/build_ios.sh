#!/bin/bash

build() {
    echo "Building ios libs"
    cd native
    `cargo build --target aarch64-apple-ios --target x86_64-apple-ios --target aarch64-apple-ios-sim --release`
    `cp target/aarch64-apple-ios/release/libnative.a ../ios/libs/aarch64-apple-ios/libnative.a`
    `cp target/x86_64-apple-ios/release/libnative.a ../ios/libs/x86_64-apple-ios/libnative.a`
    `cp target/aarch64-apple-ios-sim/release/libnative.a ../ios/libs/aarch64-apple-ios-sim/libnative.a`
}

build