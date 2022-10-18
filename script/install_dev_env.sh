#!/bin/bash

echo "Installing rust targets"
rustup target add \
    aarch64-linux-android \
    armv7-linux-androideabi \
    x86_64-linux-android \
    i686-linux-android \
    aarch64-pc-windows-msvc \
    aarch64-apple-ios \
    x86_64-apple-ios \
    aarch64-apple-ios-sim \
    aarch64-pc-windows-msvc \
    x86_64-pc-windows-msvc

echo "Installing cargo-ndk"
cargo install cargo-ndk

echo "Installing cargo-lipo"
cargo install cargo-lipo

echo "Installing cargo-xcode"
cargo install cargo-xcode

echo "Installing just"
cargo install just

echo "Installing flutter_rust_bridge_codegen"
cargo install flutter_rust_bridge_codegen
