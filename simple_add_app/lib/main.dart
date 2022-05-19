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
  // Porperty
  late TextEditingController iNum1;
  late TextEditingController iNum2;
  late int result;
  late String str;

  @override
  void initState() {
    iNum1 = TextEditingController();
    iNum2 = TextEditingController();
    result = 0;
    str = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          str = "";
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('덧셈 구하기'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   '덧셈 결과: $result',
              //   style: const TextStyle(fontSize: 17),
              // ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  controller: iNum1,
                  decoration: const InputDecoration(
                      labelText: '첫번째 숫자를 입력하세요',
                      labelStyle: TextStyle(fontSize: 12)),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  controller: iNum2,
                  decoration: const InputDecoration(
                      labelText: '두번째 숫자를 입력하세요',
                      labelStyle: TextStyle(fontSize: 12)),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // 사용자의 입력 내용 확인
                    if (iNum1.text.trim().isEmpty | iNum2.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      setState(() {
                        result = int.parse(iNum1.text.trim()) +
                            int.parse(iNum2.text.trim());
                        str = '입력하신 숫자의 합은 $result 입니다.';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45)),
                  icon: const Icon(Icons.add),
                  label: const Text('덧셈계산'),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                str,
                style: const TextStyle(
                  color: Colors.red, 
                  fontSize: 20,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
