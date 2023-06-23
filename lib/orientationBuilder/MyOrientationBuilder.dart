import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyOrientationBuilder());
}

class MyOrientationBuilder extends StatefulWidget {
  const MyOrientationBuilder({Key? key}) : super(key: key);

  @override
  MyOrientationBuilderContainer createState() => MyOrientationBuilderContainer();
}

bool _isNightTheme = false;

class MyOrientationBuilderContainer extends State<MyOrientationBuilder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (

      theme: ThemeData (
        brightness: _isNightTheme ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.yellow,
      ),

      home: const MyOrientationBuilderBarPage(),
    );
  }
}

class MyOrientationBuilderBarPage extends StatefulWidget {
  const MyOrientationBuilderBarPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyOrientationBuilderBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar (
          title: const Text (
              'MyOrientationBuilder'
          ),

          centerTitle: true,
        ),
        body: OrientationBuilder (
          builder: (BuildContext context, Orientation orientation) {
            return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
                children: List.generate(50, (position) {
                  return Center (
                    child: Text('Item $position'),
                  );
                })
            );
        }),

        floatingActionButton: FloatingActionButton (
          child: const Icon(Icons.nightlight),
          onPressed: () {
            setState(() {
              _isNightTheme = true;
            });
          },
        ),
    );
  }
}