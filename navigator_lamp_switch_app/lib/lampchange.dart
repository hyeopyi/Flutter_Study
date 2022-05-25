import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/lampStatus.dart';

class LampChange extends StatefulWidget {
  const LampChange({Key? key}) : super(key: key);

  @override
  State<LampChange> createState() => _LampChangeState();
}

class _LampChangeState extends State<LampChange> {
  // Property
  late bool lampColor;
  late bool lampOn;

  @override
  void initState() {
    lampColor = false;
    lampOn = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Red'),
                Switch(
                    value: lampColor,
                    onChanged: (value) {
                      setState(() {
                        if(lampOn) {
                          lampColor = value;
                        }else{
                          lampColor = false;
                        }
                        
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('On'),
                Switch(
                    value: lampOn,
                    onChanged: (value) {
                      setState(() {
                        lampOn = value;
                        if(lampOn == false){
                          lampColor = false;
                        }
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if(lampOn) {
                  if(lampColor) {
                    LampStatus.imagePath = 'images/lamp_red.png';
                  }else{
                    LampStatus.imagePath = 'images/lamp_on.png';
                  }
                }else{
                  LampStatus.imagePath = 'images/lamp_off.png';
                }

                Navigator.pop(context);
              
              }, 
              child: const Text('OK')),
          ],
        ),
      ),
    );
  }
}
