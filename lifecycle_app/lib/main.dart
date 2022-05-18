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
  // Property
  late String _buttonState;
  late String _buttonText;
  late Color _buttonColor;

  @override
  void initState() {
    _buttonState = 'OFF'; // 전역변수
    _buttonText = '버튼을 누르세요';
    _buttonColor = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor)
              ),
              child: Text(_buttonText),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼 상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

  // --- functions
  _onClick() {
    setState(() {
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
        _buttonText = 'Press Button';
        _buttonColor = Colors.blue;
      } else {
        _buttonState = 'OFF';
        _buttonText = '버튼을 누르세요';
        _buttonColor = Colors.red;
      }
    });
    // _buttonState = "ON"; // 내부적인 변수는 바뀌었지만 화면이 바뀌지 않는다 builder에게 신호를 줘야한다
  }
} // End
