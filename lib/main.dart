import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'operationPage.dart';

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
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fabric Database", style: TextStyle(fontSize: 30.0,),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              controller: userNameTextEditingController,
              decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.red), onPressed: ()=>print("Se xoa het chu di"),)
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              controller: passwordTextEditingController,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.red), onPressed: ()=>print("Se xoa het chu di"),)
              ),
            ),
            FlatButton.icon(
                onPressed: () {
                  if (value > 0) {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => OperationPage()),
                    );
                  }
                  else {
                        print(value);
                        print("Sai vai ca lon");
                      }
                  } ,
                icon: Icon(Icons.home), label: Text("Dang nhap"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

