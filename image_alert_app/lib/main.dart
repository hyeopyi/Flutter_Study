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
        primarySwatch: Colors.red,
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
  //Property
  late bool _lampOnOff; // true-on, false-off
  late String _lampStatus; // 켜짐, 꺼짐 상태에 대한 메세지
  late String _lampImage;

  @override
  void initState() {
    super.initState();
    _lampOnOff = true;
    _lampStatus = '현재 램프가 켜진 상태 입니다.';
    _lampImage = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                width: 350,
                height: 550,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    Image.asset(
                      _lampImage,
                      width: 250,
                      height: 350,
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      decisionOn(context);
                    },
                    child: const Text('켜기')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      decisionOff(context);
                    },
                    child: const Text('끄기')),
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Function ---
  decisionOn(BuildContext context) {
    if (_lampOnOff == true) {
      // 램프 켜진상태에서 켜기버튼 누른경우
      _showDialogAlert(context);
    } else {
      // 램프가 꺼진 상태에서 켜기 버튼을 누른경우
      setState(() {
        _lampImage = 'images/lamp_on.png';
        _lampStatus = '현재 램프가 켜진 상태 입니다.';
        _lampOnOff = true;
      });
    }
  }

  decisionOff(BuildContext context) {
    if (_lampOnOff == true) {
      // 램프가 켜진 상태에서 끄기를 눌렀을 경우
      _showDialogLampOff(context);
    } else {
      // 램프가 꺼진 상태에서 끄기를 눌렀을 경우
      _showDialogAlert(context);
    }
  }

  _showDialogAlert(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('경고',
            style: TextStyle(fontWeight: FontWeight.bold),),
            content: Text(_lampStatus),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('네, 알겠습니다.'),
              ),
            ],
          );
        });
  }

  _showDialogLampOff(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('램프 끄기',
            style: TextStyle(fontWeight: FontWeight.bold),),
            content: const Text('램프를 끄시겠습니까'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  setState(() {
                    _lampImage = 'images/lamp_off.png';
                    _lampOnOff = false;
                    _lampStatus = '현재 램프는 꺼진 상태 입니다.';
                  });
                },
                child: const Text('네'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
            ],
          );
        });
  }
}
