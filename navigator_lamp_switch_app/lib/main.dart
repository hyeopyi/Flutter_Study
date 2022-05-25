import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/lampShow.dart';
import 'package:navigator_lamp_switch_app/lampchange.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Property
  
  
  @override
  Widget build(BuildContext context) {

  
    return MaterialApp(
      routes: {
        '/' :(context) => const LampShow(), // static 변수
        '/2' :(context) => const LampChange(),
      },
      initialRoute: '/',
 
    );
  }
}

