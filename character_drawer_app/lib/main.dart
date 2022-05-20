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
  late TextEditingController dispStr;
  late String character;
  late List str = [];
  late int currentStr;

  @override
  void initState() {
    dispStr = TextEditingController();
    str = [];
    currentStr = 0;
    character = "";
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
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                character,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    
              ),
              
            ],
          ),
        ),
        drawer: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Drawer(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 320,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '광고할 문구를 입력하세요',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: dispStr,
                      decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 사용자의 입력 내용 확인
                      if (dispStr.text.trim().isEmpty) {
                        Navigator.pop(context);
                        errorSnackBar(context);
                      } else {
                        Navigator.pop(context);
                        setState(() {
                          character = "";                          
                        });
                        str = dispStr.text.split('');
                        currentStr = 0;
                        character = str[currentStr];
                      }
                    },
                    child: const Text('광고문구 생성'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // -- Function
  changeString() {
    setState(() {
      currentStr++;
      if (currentStr > str.length - 1) {
        currentStr = 0;
        character = str[currentStr];
      } else {
        character += str[currentStr];
      }
    });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('광고를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
