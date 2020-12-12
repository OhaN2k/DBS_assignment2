import 'dart:io';

import 'package:flutter/material.dart';
import 'Establish Connect/connectService.dart';
import 'Operation View/operationPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DB Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ASSIGNMENT 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int value = 7;
  bool _validate = false;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fabric Database",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              controller: userName,
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.red),
                    onPressed: () => userName.clear(),
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              controller: password,
              decoration: InputDecoration(
                  errorText: _validate
                      ? 'Incorrect Password.\nPlease try again.'
                      : null,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.red),
                    onPressed: () => password.clear(),
                  )),
              obscureText: true,
            ),
            FlatButton.icon(
                onPressed: () async {
                  var error;
                  if (value > 0) {
                    await Service(userName.text, password.text)
                        .connect()
                        .then((onValue) {
                      error = onValue;
                    });
                    print(error);
                    if (error == null) {
                      setState(() {
                        _validate = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OperationPage()),
                      );
                    } else {
                      setState(() {
                        _validate = true;
                      });
                    }
                  }
                },
                icon: Icon(Icons.home),
                label: Text("Loggin")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
