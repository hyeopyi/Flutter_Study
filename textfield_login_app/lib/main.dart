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
  final String id = 'root';
  final String passwd = 'qwer1234';
  final idControl = TextEditingController();
  final passwdControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login In'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          const Icon(
            Icons.account_circle,
            size: 110,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: idControl,
              decoration: const InputDecoration(labelText: '사용자 ID를 입력하세요'),
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwdControl,
              obscureText: true,
              decoration: const InputDecoration(labelText: '패스워드를 입력하세요'),
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                if (idControl.text.trim().isEmpty ||
                    passwdControl.text.trim().isEmpty) {                  
                  _snackBarFunction(context, '사용자 ID와 패스워드를 입력하세요', Colors.red);
                } else {
                  if (idControl.text.trim() == id &&
                      passwdControl.text.trim() == passwd) {
                    _showDialog(context);
                  } else {                    
                    _snackBarFunction(context, '사용자 ID나 암호가 맞지 않습니다', Colors.blue);
                  }
                }
              },
              child: const Text('Log In')),
        ]),
      ),
    );
  }

  // --- Functions
  _snackBarFunction(BuildContext context, String message, Color cols) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: cols,
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              '환영합니다',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('신분이 확인 되었습니다'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
} // End
