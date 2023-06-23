import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyTabController());
}

class MyTabController extends StatefulWidget {
  const MyTabController({Key? key}) : super(key: key);

  @override
  MyTabControllerContainer createState() => MyTabControllerContainer();
}

class MyTabControllerContainer extends State<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MyTabControllerPage(),
    );
  }
}

class MyTabControllerPage extends StatefulWidget {
  const MyTabControllerPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyTabControllerPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController (
      length: 3,
      child: Scaffold (
        appBar: AppBar (
          title: const Text (
              'TabController'
          ),

          bottom: const TabBar (
            tabs: [
              Tab(icon: Icon(Icons.access_alarm)),
              Text('Tab2'),
              Text('Tab3'),
            ],
          ),

          centerTitle: true,
        ),

        body: const TabBarView (
          children: [
            Icon(Icons.access_alarm),
            Center(child: Text('Tab2')),
            Center(child: Text('Tab3')),
          ],
        ),
      ),
    );
  }
}