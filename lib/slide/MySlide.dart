import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MySlide());
}

class MySlide extends StatefulWidget {
  const MySlide({Key? key}) : super(key: key);

  @override
  MySlideContainer createState() => MySlideContainer();
}

class MySlideContainer extends State<MySlide> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MySlidePage(),
    );
  }
}

class MySlidePage extends StatefulWidget {
  const MySlidePage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MySlidePage> {

  @override
  Widget build(BuildContext context) {
    return PageView (
      children: [
        Container (
          color: Colors.red,
        ),
        Container (
          color: Colors.blue,
        ),
        Container (
          color: Colors.green,
        ),
      ],
    );
  }
}