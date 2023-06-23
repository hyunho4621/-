import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MySnackBar());
}

class MySnackBar extends StatefulWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  MySnackBarContainer createState() => MySnackBarContainer();
}

class MySnackBarContainer extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MySnackBarPage(),
    );
  }
}

class MySnackBarPage extends StatefulWidget {
  const MySnackBarPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MySnackBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text (
            'SnackBar'
        ),

        centerTitle: true,
      ),

      body: Builder(builder: (context) => Center (
        child: RaisedButton (
          onPressed: () {
            final snackBar = SnackBar (
              content: Text('메일이 삭제되었습니다.'),
              action: SnackBarAction(label: '취소', onPressed: () {

              }),
            );

            Scaffold.of(context).showSnackBar(snackBar);
          },

          child: const Text ('Show SnackBar'),
        ),
      ),
      )
    );
  }
}