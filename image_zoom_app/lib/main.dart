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
  // Property
  late String _lampImage; // Image Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late String _buttonName; // Button Name
  late bool _switch; // switch status
  late String _lampSizeStatus; // Image Size Status

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    _lampSizeStatus = 'small';
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
            SizedBox(  // 컬러값을 못준다. container만 컬러값을 줄수있다
              width: 350,
              height: 650,
              child: Column( // 컬럼을 넣어야 child가 children으로 변경되어 사이즈 조절가능
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( // child는 모든 권환을 다 가지고 있어 확대 축소가 안된다
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
                TextButton(
                    onPressed: () {
                      setState(() {
                        decisionLampSize();
                      });
                    },
                    child: Text(_buttonName)),
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

  decisionOnOff() {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonName = "Image 축소";
      _lampSizeStatus = 'large';
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = "Image 확대";
      _lampSizeStatus = 'small';
    }
  }
} // End
