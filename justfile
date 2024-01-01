set windows-powershell
native := "rust"
release := "true"
in_rust := "--manifest-path " + native + "/Cargo.toml"

default: gen lint

gen:
    flutter pub get
    flutter_rust_bridge_codegen generate

lint:
    cargo fmt {{in_rust}}
    dart format .

clean:
    flutter clean
    cargo clean {{in_rust}}
    
build-web href='/':
    wasm-pack build {{native}} \
        --no-pack {{ if release == "true" { "--release" } else { "" } }} \
        --no-typescript -t no-modules -d ../web/pkg
    flutter build web --base-href={{href}}

# vim:expandtab:sw=4:ts=4
