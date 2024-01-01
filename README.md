# flutter_rust_bridge_template

This repository serves as a template for Flutter projects calling into native Rust
libraries via `flutter_rust_bridge`.

> [!NOTE]
> As of v2, flutter_rust_bridge now comes with its own [`create`](https://cjycode.com/flutter_rust_bridge/quickstart)
> command to create a batteries-included Flutter project set up with Rust support for all platforms.
> This template remains available for legacy purposes and as a minimal, opinionated configuration.

## Getting Started

To begin, ensure that you have a working installation of the following items:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Rust language](https://rustup.rs/)
- `flutter_rust_bridge_codegen` [cargo package](https://cjycode.com/flutter_rust_bridge/v1/integrate/deps.html#build-time-dependencies)
- Appropriate [Rust targets](https://rust-lang.github.io/rustup/cross-compilation.html) for cross-compiling to your device
- For Android targets:
    - Install [cargo-ndk](https://github.com/bbqsrc/cargo-ndk#installing)
    - Install [Android NDK 22](https://github.com/android/ndk/wiki/Unsupported-Downloads#r22b), then put its path in one of the `gradle.properties`, e.g.:

```bash
echo "ANDROID_NDK=.." >> ~/.gradle/gradle.properties
```

- For iOS targets:
  - Install [cargo-xcode](https://gitlab.com/kornelski/cargo-xcode#installation)
- [Web dependencies](http://cjycode.com/flutter_rust_bridge/v1/template/setup_web.html) for the Web

Then go ahead and run `flutter run`. When you're ready, refer to our documentation
[here](https://cjycode.com/flutter_rust_bridge) to learn how to write and use binding code.
(For Flutter Web, use `just build-web` and set up an NGINX server using `nginx.conf`.)

Once you have edited `api/entry.rs` to incorporate your own Rust code, the bridge files are generated using `flutter_rust_bridge_codegen generate`.
Change the configuration in `flutter_rust_bridge.yml` to match your needs.

## Scaffolding in existing projects

If you would like to generate boilerplate for using `flutter_rust_bridge` in your existing projects,
check out the [`flutter_rust_bridge` brick](https://brickhub.dev/bricks/flutter_rust_bridge/)
for more details.

## Disclaimer

This template is not affiliated with flutter_rust_bridge. Please file issues and PRs related to the template here,
not flutter_rust_bridge.

## License

Copyright 2023 Viet Dinh.

This template is licensed under either of
- [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) ([LICENSE-APACHE](LICENSE-APACHE))
- [MIT license](https://opensource.org/licenses/MIT) ([LICENSE-MIT](LICENSE-MIT))

at your option.

The [SPDX](https://spdx.dev/) license identifier for this project is `MIT OR Apache-2.0`.
