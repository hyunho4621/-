import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyAnimatedContainer());
}

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  _AnimatedOpacityState createState() => _AnimatedOpacityState();
}

class _AnimatedOpacityState extends State<MyAnimatedContainer> {
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

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text (
          'AnimatedOpacity'
        ),

        centerTitle: true,
      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Center (
            child: AnimatedOpacity (
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration (
                milliseconds: 500
              ),

              child: Container (
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
          ),

          const SizedBox (
            height: 16,
          ),

          Column(
            children: [
              Center (
                child: TextButton (

                  child: const Text (
                      '박스 ON'
                  ),

                  onPressed: () {
                    setState(() {
                      _visible = true;
                    });
                  },
                ),
              ),

              Center (
                child: TextButton (
                  child: const Text (
                      '박스 OFF'
                  ),

                  onPressed: () {
                    setState(() {
                      _visible = false;
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}