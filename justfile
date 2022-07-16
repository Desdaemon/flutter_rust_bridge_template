default: gen lint

gen:
    export REPO_DIR="$PWD"; cd /; flutter_rust_bridge_codegen {{llvm_path}} \
        --rust-input "$REPO_DIR/native/src/api.rs" \
        --dart-output "$REPO_DIR/lib/bridge_generated.dart" \
        --c-output "$REPO_DIR/ios/Runner/bridge_generated.h" \
        --c-output "$REPO_DIR/macos/Runner/bridge_generated.h"

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean

# vim:expandtab:sw=4:ts=4
