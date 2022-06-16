# Homebrew installs LLVM in a place that is not visible to ffigen.
# This explicitly specifies the place where the LLVM dylibs are kept.
llvm_path := if os() == "macos" {
    "--llvm-path /opt/homebrew/opt/llvm"
} else {
    ""
}

default: gen lint

gen:
    export REPO_DIR="$PWD"; cd /; flutter_rust_bridge_codegen {{llvm_path}} \
        --rust-input "$REPO_DIR/native/src/api.rs" \
        --dart-output "$REPO_DIR/lib/bridge_generated.dart" \
        --c-output "$REPO_DIR/ios/Runner/bridge_generated.h" \
        --c-output "$REPO_DIR/macos/Runner/bridge_generated.h"
    # Uncomment this line to invoke build_runner as well
    # flutter pub run build_runner build

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean

# vim:expandtab:sw=4:ts=4
