import 'package:flutter/material.dart';


class SendEmail extends StatelessWidget {
  const SendEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Send Mail'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('  유비에게 보낸 메일'),
          Text('  관우에게 보낸 메일'),
          Text('  장비에게 보낸 메일')
        ],
      ),
    );

    
  }
}