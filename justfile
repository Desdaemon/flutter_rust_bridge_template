default: gen lint

gen:
    flutter pub get
    flutter_rust_bridge_codegen

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean
    
serve *args='':
    flutter pub run flutter_rust_bridge:serve {{args}}

build-web href='/':
    cd native && wasm-pack build \
        --no-pack --release --no-typescript -t no-modules -d ../web/pkg
    flutter build web --base-href={{href}}

# vim:expandtab:sw=4:ts=4
