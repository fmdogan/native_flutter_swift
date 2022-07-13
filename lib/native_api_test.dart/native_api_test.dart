import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_flutter_swift/controller/home_controller.dart';

class NativeApiTest {
  NativeApiTest._();

  static const _platform = MethodChannel('native_test');

  static register() {
    _platform.setMethodCallHandler((call) async {
      switch (call.method) {
        case "fetchData":
          // platform.invokeMethod("fetchDataResponse", "test");
          debugPrint("test native : from Flutter : fetchData");

          return "sdfsddsfdsfdsfsf";
        case "async":
          debugPrint("test native : from Flutter : async : ${call.arguments}");
          await Future.delayed(const Duration(milliseconds: 1000));
          return "my async message";
        case "print":
          debugPrint("test native : from Flutter : print : ${call.arguments}");
          return "args printed";
        default:
      }
    });
  }

  static Future getData([arg1, arg2]) async {
    var value = await _platform.invokeMethod("getData", {"arg1": arg1 ?? "my arg1", "arg2": arg2 ?? "my arg2"});
    debugPrint("test native : getData : $value");
    return value;
  }

  static Future asyncTest([arg1, arg2]) async {
    var value = await _platform.invokeMethod("asyncTest");
    debugPrint("test native : asyncTest : $value");
    return value;
  }
}
