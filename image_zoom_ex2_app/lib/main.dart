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
  late String _lampImage; // Image Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late bool _switch; // switch status
  late bool _lampSizeStatus; // Image Size Status  true - large, false - small
  late bool _lampColorStatus; // false-yellow, ture-red

  @override
  void initState() {
    // 화면이 뜨기전에 세팅되는 부분
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150; // 그림 사이지는 double 형
    _lampHeight = 300;
    _switch = true;
    _lampSizeStatus = false;
    _lampColorStatus = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // 컬러값을 못준다. container만 컬러값을 줄수있다
              width: 350,
              height: 650,
              child: Column(
                // child일 경우 모든 권한을 가고 있어 크기 변경 불가능, 컬럼을 넣어야 child가 children으로 변경되어 사이즈 조절가능
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    // child는 모든 권환을 다 가지고 있어 확대 축소가 안된다
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('전구 색깔'),
                    Switch(
                        value: _lampColorStatus,
                        onChanged: (value) {
                          setState(() {
                            _lampColorStatus = value;
                            decisionLampColor();
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text('전구 확대'),
                    Switch(
                        value: _lampSizeStatus,
                        onChanged: (value) {
                          setState(() {
                            _lampSizeStatus = value;
                            decisionLampSize();
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text('전구 스위치'),
                    Switch(
                        value: _switch,
                        onChanged: (value) {
                          setState(() {
                            _switch = value;
                            decisionOnOff();
                          });
                        }),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Functions ---

  decisionLampColor() {
    if (_switch == true) {
      if (_lampColorStatus == true) {
        _lampImage = 'images/lamp_red.png';
      } else {
        _lampImage = 'images/lamp_on.png';
      }
    } else {
      _lampColorStatus = false;
    }
  }

  decisionOnOff() {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
      _lampColorStatus = false;
    }
  }

  decisionLampSize() {
    if (_lampSizeStatus == true) {
      _lampWidth = 300;
      _lampHeight = 600;
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
    }
  }
} // End
 