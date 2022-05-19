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
  late TextEditingController iNum1;
  late TextEditingController iNum2;
  late TextEditingController addResult;
  late TextEditingController subResult;
  late TextEditingController multiResult;
  late TextEditingController divResult;

  @override
  void initState() {
    iNum1 = TextEditingController();
    iNum2 = TextEditingController();
    addResult = TextEditingController();
    subResult = TextEditingController();
    multiResult = TextEditingController();
    divResult = TextEditingController();

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
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    controller: iNum1,
                    decoration:
                        const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    controller: iNum2,
                    decoration:
                        const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (iNum1.text.trim().isEmpty |
                            iNum2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          addResult.text =
                              (int.parse(iNum1.text) + int.parse(iNum2.text))
                                  .toString();
                          subResult.text =
                              (int.parse(iNum1.text) - int.parse(iNum2.text))
                                  .toString();
                          multiResult.text =
                              (int.parse(iNum1.text) * int.parse(iNum2.text))
                                  .toString();
                          divResult.text = (double.parse(iNum1.text) /
                                  double.parse(iNum2.text))
                              .toString();
                        }
                      },
                      child: const Text('계산하기'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                        ),
                        onPressed: () {
                          iNum1.text = "";
                          iNum2.text = "";
                          addResult.text = "";
                          subResult.text = "";
                          divResult.text = "";
                          multiResult.text = "";
                        },
                        child: const Text('지우기')),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: addResult,
                    decoration: const InputDecoration(labelText: '덧셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: subResult,
                    decoration: const InputDecoration(labelText: '뺄셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: multiResult,
                    decoration: const InputDecoration(labelText: '곱셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: divResult,
                    decoration: const InputDecoration(labelText: '나눗셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
