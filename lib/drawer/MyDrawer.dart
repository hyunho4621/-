import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyDrawer());
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  MyDrawerContainer createState() => MyDrawerContainer();
}

class MyDrawerContainer extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MyDrawerPage(),
    );
  }
}

class MyDrawerPage extends StatefulWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyDrawerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text (
            'Drawer'
        ),

        centerTitle: true,
      ),

      drawer: Drawer (
        child: ListView (

          padding: EdgeInsets.zero,

          children: [
            const DrawerHeader (
              decoration: BoxDecoration (
                color: Colors.lightBlue
              ),
              child: Text('Header'),
            ),
            ListTile (
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile (
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile (
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
    );
  }
}