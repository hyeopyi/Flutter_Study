import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal/main2.dart';
import 'package:navigator_tabbar_ex_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Login(),
        '/list' :(context) => const MyHomePage(),
      },
      initialRoute: '/',
  
    );
  }
}

