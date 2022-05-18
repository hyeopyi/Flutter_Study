import 'package:alert_dialog_ex_app/firstpage.dart';
import 'package:alert_dialog_ex_app/sencondpage.dart';
import 'package:flutter/material.dart';

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
        '/1': (context) => const FirstPage(),
        '/2': (context) => const SecondPage(),
      },
      initialRoute: '/1',
    );
  }
}

