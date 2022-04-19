import 'package:flutter/foundation.dart';

import 'bridge_generated.d.dart';
export 'bridge_generated.d.dart';

class NativeImpl implements Native {
  const NativeImpl();

  @override
  Future<Platform> platform({dynamic hint}) {
    return Future.value(Platform.Wasm);
  }

  @override
  Future<bool> rustReleaseMode({dynamic hint}) {
    return Future.value(!kDebugMode);
  }
}

const api = NativeImpl();
