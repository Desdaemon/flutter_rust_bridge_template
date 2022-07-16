default: gen lint

gen:
    flutter_rust_bridge_codegen {{llvm_path}} \
        --rust-input native/src/api.rs \
        --dart-output lib/bridge_generated.dart \
        --c-output ios/Runner/bridge_generated.h
    # uncomment this line to copy to MacOS
    #   --c-output macos/Runner/bridge_generated.h

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean

# vim:expandtab:sw=4:ts=4
