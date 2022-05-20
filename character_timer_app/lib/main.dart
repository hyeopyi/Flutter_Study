import 'dart:async';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dispStr = '대한민국';
  late String character;
  late List str = [];
  late int currentStr;

  @override
  void initState() {
    str = dispStr.split('');
    currentStr = 0;
    character = str[currentStr];
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              character,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // -- Function
  changeString() {
    setState(() {
      currentStr++;
      if (currentStr >= dispStr.length) {
        currentStr = 0;
        character = str[currentStr];
      } else {
        character += str[currentStr];
      }
    });
  }
}
