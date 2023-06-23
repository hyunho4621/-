
import 'package:flutter/material.dart';

void main() {
  runApp(const MyFormValidation());
}

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({Key? key}) : super(key: key);

  @override
  MyFormValidationContainer createState() => MyFormValidationContainer();
}

class MyFormValidationContainer extends State<MyFormValidation> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp (

      home: MyFormValidationPage(),
    );
  }
}

class MyFormValidationPage extends StatefulWidget {
  const MyFormValidationPage({Key? key}) : super(key: key);

  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyFormValidationPage> {

  final _formKey = GlobalKey<FormState>();
  late FocusNode nameFocusNode;

  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text('Form Validation'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form (

          key: _formKey,

          child: Column (

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              TextFormField (
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return '공백은 허용되지 않습니다.';
                  }
                },
              ),

              Padding (
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton (
                    onPressed: () {

                    },

                    child: const Text('완료'),
                ),
              ),

              TextField (
                controller: nameController,
                onChanged: (text) {
                  print(text);
                },
                focusNode: nameFocusNode,
                decoration: const InputDecoration (
                  hintText: '이름을 입력해 주세요',
                  border: InputBorder.none
                ),
                autofocus: true,
              ),
              RaisedButton (
                  onPressed: () {
                    FocusScope.of(context).requestFocus(nameFocusNode);
                  },

                  child: const Text('포커스'),
              ),
              
              RaisedButton (
                  onPressed: () {
                    print(nameController.text.toString());
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog (
                            content: Text(nameController.text),
                          );
                        }
                    );
                  },

                  child: const Text('TextField 값 확인'),
              )
            ],
          ),
        ),
      ),
    );
  }
}