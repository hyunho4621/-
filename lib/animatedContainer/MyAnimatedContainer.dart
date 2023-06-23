
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyAnimatedContainer());
}

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<MyAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MyAnimatedPage(),
    );
  }
}

class MyAnimatedPage extends StatefulWidget {
  const MyAnimatedPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyAnimatedPage> {

  double _width = 50;
  double _height = 50;

  Color _color = Colors.green;

  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      appBar: AppBar (
        title: const Text(
          'AnimatedContainer', style: TextStyle(fontWeight: FontWeight.bold)
        ),

        centerTitle: true,
      ),
      body: Center (
        child: AnimatedContainer (
          width: _width,
          height: _height,

          duration: const Duration (
            seconds: 1
          ),

          decoration: BoxDecoration (
            color: _color,
            borderRadius: _borderRadius
          ),

          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: () {

          setState(() {
            final random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO (
                random.nextInt(256), random.nextInt(256), random.nextInt(256), 1
            );

            _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}