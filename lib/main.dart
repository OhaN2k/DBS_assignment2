import 'package:flutter/material.dart';
import 'Manager View/view.dart';
//import 'package:bloc/bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

/*
This is the root of our app
Routing is used for easy testing and app screen access
Theme is also defined here
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'QuickSand',
          buttonTheme: ButtonThemeData(
            minWidth: 0,
            height: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),
      routes: {
        '/login': (context) => ManagerView(),
      },
      initialRoute: '/login',
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
