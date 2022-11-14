#!/bin/bash

export IPHONEOS_DEPLOYMENT_TARGET=11.0
LIBNAME="native"

build() {
    echo "Building ios libs"

    cd native
 
    rustup target add aarch64-apple-ios aarch64-apple-ios-sim x86_64-apple-ios
    cargo build --target aarch64-apple-ios --release
    cargo build --target aarch64-apple-ios-sim --release
    cargo build --target x86_64-apple-ios --release

    lipo "target/aarch64-apple-ios-sim/release/lib$LIBNAME.a" "target/x86_64-apple-ios/release/lib$LIBNAME.a" -output "target/aarch64-apple-ios-sim/lib$LIBNAME.a" -create

    cd ../ios

    xcodebuild \
        -create-xcframework \
        -library ../native/target/aarch64-apple-ios/release/lib$LIBNAME.a \
        -library ../native/target/aarch64-apple-ios-sim/lib$LIBNAME.a \
        -output $LIBNAME.xcframework 

    zip -r $LIBNAME_ios.xcframework.zip $LIBNAME.xcframework
    rm $LIBNAME_ios.xcframework.zip
}

build