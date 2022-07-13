import 'package:flutter/material.dart';
import 'package:native_flutter_swift/controller/home_controller.dart';
import 'package:native_flutter_swift/model/home_model.dart';
import 'package:native_flutter_swift/native_api_test.dart/native_api_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NativeApiTest.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text("getData"),
              onTap: () => HomeController.getData(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<String>(
                stream: HomeModel.valGetData.stream,
                builder: (context, snapshot) {
                  return Text(HomeModel.valGetData.get);
                },
              ),
            ),
            ListTile(
              title: const Text("asyncTest"),
              onTap: () => HomeController.asyncTest(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<String>(
                stream: HomeModel.valAsyncTest.stream,
                builder: (context, snapshot) {
                  return Text(HomeModel.valAsyncTest.get);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
