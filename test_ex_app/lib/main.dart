import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test Excercise 01',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '유비',
            ),
            Text(
              '관우'
            ),

            Text(
              '장비',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '조조',
            ),
            Text(
              '여포'
            ),

            Text(
              '동탁',
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
