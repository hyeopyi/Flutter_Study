import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';

class Change extends StatefulWidget {
  const Change({Key? key}) : super(key: key);

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  late TextEditingController controller;
  late bool lampOnOff;

  late bool prevLampOnOff;
  late String prevText;


  @override
  void initState() {
    controller = TextEditingController();
    controller.text = Message.msg;
    lampOnOff = Message.lampOnOff;
    prevLampOnOff = Message.lampOnOff;
    prevText = Message.msg;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        leading: IconButton(
          onPressed: (){
            Message.lampOnOff = prevLampOnOff;
            Message.msg = prevText;
            Navigator.pop(context);

          }, 
          icon: const Icon(Icons.arrow_back_ios_new)),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Switch(
                value: lampOnOff,
                onChanged: (value) {
                  setState(() {
                    prevLampOnOff = lampOnOff;
                    lampOnOff = value;
                    Message.lampOnOff = value;
                  });
                }),
                ElevatedButton(
                  onPressed: (){
                    Message.msg = controller.text;
                    Navigator.pop(context);
                  }, 
                  child: const Text('OK')
                  ),
          ],
        ),
      ),
    );
  }
}
