import 'package:flutter/material.dart';


class Email2nd extends StatelessWidget {
  const Email2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recieved Email'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('유비에게서 온 메일'),
          Text('관우에게서 온 메일'),
          Text('장비에게서 온 메일'),
        ],
        
      ),
    );
    
  }
}