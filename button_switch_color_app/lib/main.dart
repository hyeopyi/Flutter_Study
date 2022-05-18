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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Property
  late bool switchValue;
  late Color buttoncolor;

  @override
  void initState() {
    switchValue = false;
    buttoncolor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Changed Button Color on Switch',
        style: TextStyle(fontSize: 17),),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (buttoncolor == Colors.red) {
                    buttoncolor = Colors.blue;
                    switchValue = false;
                  } else {
                    buttoncolor = Colors.red;
                    switchValue = true;
                  }
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttoncolor)),
              child: const Text('Flutter'),  // child는 맨뒤로 보낸다
            ),
            Switch(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    if (value == false) {
                      buttoncolor = Colors.blue;
                      switchValue = value;
                    } else {
                      buttoncolor = Colors.red;
                      switchValue = value;
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
