import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyMethodChannel());
}

class MyMethodChannel extends StatefulWidget {
  const MyMethodChannel({Key? key}) : super(key: key);

  @override
  MyMethodChannelContainer createState() => MyMethodChannelContainer();
}

class MyMethodChannelContainer extends State<MyMethodChannel> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MyMethodChannelPage(),
    );
  }
}

class MyMethodChannelPage extends StatefulWidget {
  const MyMethodChannelPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyMethodChannelPage> {

  static const platform = const MethodChannel('example.com/value');

  String _value = 'null';

  Future<void> _getNativeValue() async {
    String value;

    try {
      value = await platform.invokeMethod('getValue');
    } on PlatformException catch (e) {
      value = '네이티브 코드 실행 에러 : ${e.message}';
    }

    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar (
          title: const Text (
              'MethodChannelPage'
          ),

          centerTitle: true,
        ),

        body: Center (
          child: Column (

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(_value),
              RaisedButton (
                  child: Text (
                    '네이티브 값 얻기'
                  ),
                  onPressed: () {
                    _getNativeValue();
                  },
              )
            ],
          ),
        ),
    );
  }
}