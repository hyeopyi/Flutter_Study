import 'package:drawer_ex_app/received.dart';
import 'package:drawer_ex_app/screen.dart';
import 'package:drawer_ex_app/send.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Screen(),
        '/send' :(context) => const SendEmail(),
        '/received' :(context) =>  const ReceivedEmail(),

      },
      initialRoute:  '/',
   
    );
  }
}

