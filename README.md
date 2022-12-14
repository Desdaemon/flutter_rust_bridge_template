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

- [Web dependencies](http://cjycode.com/flutter_rust_bridge/template/setup_web.html) for the Web

Then go ahead and run `flutter run`! When you're ready, refer to our documentation
[here](https://fzyzcjy.github.io/flutter_rust_bridge/index.html)
to learn how to write and use binding code.

Once you have edited `api.rs` to incorporate your own Rust code, the bridge files `bridge_definitions.dart` and `bridge_generated.dart` are generated using the following command:

### Windows
```
flutter_rust_bridge_codegen --rust-input native\src\api.rs --dart-output .\lib\bridge_generated.dart --dart-decl-output .\lib\bridge_definitions.dart
```

### Linux/MacOS/any other Unix
```
flutter_rust_bridge_codegen --rust-input native/src/api.rs --dart-output ./lib/bridge_generated.dart --dart-decl-output ./lib/bridge_definitions.dart
```

## Scaffolding in existing projects

If you would like to generate boilerplate for using `flutter_rust_bridge` in your existing projects,
check out the [`flutter_rust_bridge` brick](https://brickhub.dev/bricks/flutter_rust_bridge/)
for more details.

## License

Copyright 2022 Viet Dinh.

This template is licensed under either of
- [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) ([LICENSE-APACHE](LICENSE-APACHE))
- [MIT license](https://opensource.org/licenses/MIT) ([LICENSE-MIT](LICENSE-MIT))

at your option.

The [SPDX](https://spdx.dev/) license identifier for this project is `MIT OR Apache-2.0`.