import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReceivedEmail extends StatelessWidget {
  const ReceivedEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Mail'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('  유비에게서 온 메일'),
          Text('  관우에게서 온 메일'),
          Text('  장비에게서 온 메일')
        ],
      ),
    );
  }
}
