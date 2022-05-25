import 'package:flutter/material.dart';


class Change extends StatefulWidget {
  final String textMsg;
  final bool lampOnOff;
  const Change({Key? key, required this.textMsg, required this.lampOnOff}) : super(key: key);

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  late TextEditingController controller;
  late bool lampOnOff;

  late bool prevLampOnOff;
  late String prevText;
  
  late List returnValue = [];

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = widget.textMsg;
    lampOnOff = widget.lampOnOff;
    prevLampOnOff = widget.lampOnOff;
    prevText = widget.textMsg;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        leading: IconButton(
          onPressed: (){
            returnValue.add(prevText);
            returnValue.add(prevLampOnOff);
            
            Navigator.pop(context, returnValue);

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
                    prevText = widget.textMsg;
                    lampOnOff = value;
                    
                  });
                }),
                ElevatedButton(
                  onPressed: (){
                    returnValue.add(controller.text);
                    returnValue.add(lampOnOff);                    
                    Navigator.pop(context, returnValue);
                  }, 
                  child: const Text('OK')
                  ),
          ],
        ),
      ),
    );
  }
}
