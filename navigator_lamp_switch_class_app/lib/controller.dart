import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  final bool lampColor;  // 매개변수 형식
  final bool lampStatus; // 매개변수 형식  
  
   // 생성자로 값을 받아온다
  const Controller({Key? key, required this.lampColor, required this.lampStatus}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late String switchLabel;
  late String switchColorLabel;

  late bool switchValue;
  late bool switchColor;

  List status = [];  // 데이터의 전달을 위해 리스트 생성

  @override
  void initState() {
    super.initState();
    if(widget.lampColor){ // widget을 통해 매개변수 사용
      switchColorLabel = "Yellow";
      switchColor = true;
    }else{
      switchColorLabel = 'Red';
      switchColor = false;
    }

    if(widget.lampStatus){
      switchLabel = "On";
      switchValue = true;
    }else{
      switchLabel = "Off";
      switchValue = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchColorLabel),
                Switch(
                  value: switchColor, 
                  onChanged: (value){
                    setState(() {
                      switchColor = value;
                      if(value){
                        switchColorLabel = "Yellow";
                      }else{
                        switchColorLabel = "Red";
                      }
                    });
                  })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabel),
                Switch(
                  value: switchValue, 
                  onChanged: (value){
                    setState(() {
                      switchValue = value;
                      if(value){
                        switchLabel = "On";
                      }else{
                        switchLabel = "Off";
                      }
                    });
                  })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () { // 2개 이상의 데이터를 전달하기 위해 List 사용
                status.add(switchValue);
                status.add(switchColor);
                Navigator.pop(context, status);
              }, 
              child: const Text('OK'))
          ],
        ),
      ),
    );
  }
}