import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyDismissible());
}

class MyDismissible extends StatefulWidget {
  const MyDismissible({Key? key}) : super(key: key);

  @override
  MyDismissibleContainer createState() => MyDismissibleContainer();
}

class MyDismissibleContainer extends State<MyDismissible> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MyDismissiblePage(),
    );
  }
}

class MyDismissiblePage extends StatefulWidget {
  const MyDismissiblePage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyDismissiblePage> {

  final items = List<String>.generate(
      20, (index) => "Item ${index + 1}"
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar (
          title: const Text (
              'Dismissible'
          ),

          centerTitle: true,
        ),

        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {

            final item = items[index];

            return Dismissible (
              background: Container(color: Colors.red,),
              onDismissed: (direction) {
                setState(() {
                  if (direction == DismissDirection.startToEnd) {
                    items.removeAt(index);
                  } else {
                  }
                });
              },
              key: Key(item),
              child: ListTile (
                title: Text('${items[index]}'),
              ),
            );
          }),
    );
  }
}