import 'dart:ffi';

import 'bridge_generated.dart';
export 'bridge_generated.dart';
import 'dart:io' as io;

const _base = 'native';
final _dylib = io.Platform.isMacOS
    ? 'lib$_base.dylib'
    : io.Platform.isWindows
        ? '$_base.dll'
        : 'lib$_base.so';

late final Native api = NativeImpl(
    io.Platform.isIOS ? DynamicLibrary.process() : DynamicLibrary.open(_dylib));
