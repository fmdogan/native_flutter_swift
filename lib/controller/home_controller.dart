import 'package:native_flutter_swift/data/args.dart';
import 'package:native_flutter_swift/model/home_model.dart';
import 'package:native_flutter_swift/native_api_test.dart/native_api_test.dart';

class HomeController {
  static int _index = 0;
  static getData() async {
    var _args = Args.list[_index++].split(".");
    var value = await NativeApiTest.getData(_args[0], _args[1]);
    HomeModel.valGetData.set(value);

    _index %= 4;
  }

  static asyncTest() async {
    var value = await NativeApiTest.asyncTest();
    HomeModel.valAsyncTest.set(value);
  }
}
