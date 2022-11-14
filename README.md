# flutter_rust_bridge_template

This repository serves as a template for Flutter projects calling into native Rust
libraries via `flutter_rust_bridge`.

## Getting Started

To begin, ensure that you have a working installation of the following items:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Rust language](https://rustup.rs/)
- Appropriate [Rust targets](https://rust-lang.github.io/rustup/cross-compilation.html) for cross-compiling to your device
- For Android targets:
    - Install [cargo-ndk](https://github.com/bbqsrc/cargo-ndk#installing)
    - Install Android NDK 22, then put its path in one of the `gradle.properties`, e.g.:

```
echo "ANDROID_NDK=.." >> ~/.gradle/gradle.properties
```

This template use [just](https://github.com/casey/just) to get things done. You should download it.

It also use [flutter_rust_bridge_codegen](https://github.com/fzyzcjy/flutter_rust_bridge), so you should have it install on your machine. You can install it with `cargo install flutter_rust_bridge_codegen`

You also need to make sure that you have [llvm](https://releases.llvm.org/download.html) install.

You can install it as follow:

- ubuntu/linux

```
sudo apt-get install libclang-dev
```

- Windows

```
winget install -e --id LLVM.LLVM
```

- MacOs

```
brew install llvm
```

- [Web dependencies](http://cjycode.com/flutter_rust_bridge/template/setup_web.html) for the Web

Then go ahead and run `flutter run`! When you're ready, refer to our documentation
[here](https://fzyzcjy.github.io/flutter_rust_bridge/index.html)
to learn how to write and use binding code.

Once you have edited `api.rs` to incorporate your own Rust code, the bridge files `bridge_definitions.dart` and `bridge_generated.dart` are generated using the following command:

### Generate

If you have already install `just`, you can just run `just` command line and it will build everythings for you. You can check the detail of what the `just` command does in the `justfile`. To run a specific task, use `just <taskname>` 


## Scaffolding in existing projects

If you would like to generate boilerplate for using `flutter_rust_bridge` in your existing projects,
check out the [`flutter_rust_bridge` brick](https://brickhub.dev/bricks/flutter_rust_bridge/)
for more details.
