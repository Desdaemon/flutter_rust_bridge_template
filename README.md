# flutter_rust_bridge_template

This repository serves as a template for Flutter projects calling into native Rust
libraries via `flutter_rust_bridge`.

## Getting Started

To begin, ensure that you have a working installation of the following items:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Rust language](https://rustup.rs/)
- An appropriate Rust toolchain for your target device:
    - Android: [cargo-ndk](https://github.com/bbqsrc/cargo-ndk)
    - iOS: [cargo-lipo](https://github.com/timnn/cargo-lipo)
    - Desktop platforms are supported out of the box.
    - Web is not supported yet.

Then go ahead and run `flutter run`! When you're ready, refer to our documentation
[here](https://fzyzcjy.github.io/flutter_rust_bridge/index.html)
to learn how to write and use binding code.
