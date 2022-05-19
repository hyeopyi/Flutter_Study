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
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController(); // 생성자
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Single Textfield'),
        ),
        body: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(labelText: '글자를 입력하세요'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // 사용자의 입력 내용 확인
                  if (textEditingController.text.trim().isEmpty) {
                    errorSnackBar(context);
                  } else {
                    showSnackBar(context);
                  }
                },
                child: const Text('출력')),
          ],
        ),
      ),
    );
  }

  // --- Functions
  showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('입력하신 글자는 ${textEditingController.text} 입니다'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('글자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
} // End