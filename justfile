default: gen build lint

gen:
    flutter pub get
    flutter_rust_bridge_codegen \
        --rust-input native/src/api.rs \
        --dart-output lib/src/bridge_generated.dart \
        --c-output ios/Runner/bridge_generated.h \
        --c-output macos/Runner/bridge_generated.h \
        --dart-decl-output lib/src/bridge_definitions.dart \
        --wasm

build:
    ./script/build_android.sh

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean
    
serve *args='':
    flutter pub run flutter_rust_bridge:serve {{args}}

# vim:expandtab:sw=4:ts=4
