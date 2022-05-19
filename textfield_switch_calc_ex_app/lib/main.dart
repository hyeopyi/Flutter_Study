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
  late TextEditingController iNum1;
  late TextEditingController iNum2;
  late TextEditingController addCnt;
  late TextEditingController subCnt;
  late TextEditingController multiCnt;
  late TextEditingController divCnt;
  late bool switchValueAdd;
  late bool switchValueSub;
  late bool switchValueMul;
  late bool switchValueDiv;

  late int? addRst;
  late int? subRst;
  late int? muliRst;
  late double? divRst;

  @override
  void initState() {
    iNum1 = TextEditingController();
    iNum2 = TextEditingController();
    addCnt = TextEditingController();
    subCnt = TextEditingController();
    multiCnt = TextEditingController();
    divCnt = TextEditingController();

    switchValueAdd = true;
    switchValueSub = true;
    switchValueMul = true;
    switchValueDiv = true;

    addRst = 0;
    subRst = 0;
    muliRst = 0;
    divRst = 0;

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
                  height: 10,
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
                        setState(() {
                          switchValueAdd = true;
                          switchValueSub = true;
                          switchValueMul = true;
                          switchValueDiv = true;
                        });

                        if (iNum1.text.trim().isEmpty |
                            iNum2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          addRst =
                              int.parse(iNum1.text) + int.parse(iNum2.text);
                          subRst =
                              int.parse(iNum1.text) - int.parse(iNum2.text);
                          muliRst =
                              int.parse(iNum1.text) * int.parse(iNum2.text);
                          divRst = double.parse(iNum1.text) /
                              double.parse(iNum2.text);

                          addCnt.text = addRst.toString();
                          subCnt.text = subRst.toString();
                          multiCnt.text = muliRst.toString();
                          divCnt.text = divRst.toString();
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
                          addCnt.text = "";
                          subCnt.text = "";
                          divCnt.text = "";
                          multiCnt.text = "";

                          addRst = null;
                          subRst = null;
                          divRst = null;
                          muliRst = null;
                        },
                        child: const Text('지우기')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text("덧셈 :"),
                    Switch(
                      value: switchValueAdd,
                      onChanged: (value) {
                        setState(() {
                          switchValueAdd = value;
                        });
                        if (switchValueAdd == true && addRst != null) {
                          addCnt.text = addRst.toString();
                        } else {
                          addCnt.text = "";
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("뺄셈 :"),
                    Switch(
                      value: switchValueSub,
                      onChanged: (value) {
                        setState(() {
                          switchValueSub = value;
                        });
                        if (switchValueSub == true && subRst != null) {
                          subCnt.text = subRst.toString();
                        } else {
                          subCnt.text = "";
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("곱셈 :"),
                    Switch(
                      value: switchValueMul,
                      onChanged: (value) {
                        setState(() {
                          switchValueMul = value;
                        });
                        if (switchValueMul == true && muliRst != null) {
                          multiCnt.text = muliRst.toString();
                        } else {
                          multiCnt.text = "";
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("나눗셈 :"),
                    Switch(
                      value: switchValueDiv,
                      onChanged: (value) {
                        setState(() {
                          switchValueDiv = value;
                        });
                        if (switchValueDiv == true && divRst != null) {
                          divCnt.text = divRst.toString();
                        } else {
                          divCnt.text = "";
                        }
                      },
                    ),
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
                    controller: addCnt,
                    decoration: const InputDecoration(labelText: '덧셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: subCnt,
                    decoration: const InputDecoration(labelText: '뺄셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: multiCnt,
                    decoration: const InputDecoration(labelText: '곱셈결과'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 15),
                    readOnly: true,
                    controller: divCnt,
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
