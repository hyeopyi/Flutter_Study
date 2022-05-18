import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: 
        GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Move the 2nd page')),
      ),
    );
    
  }
}

// -- Functions
_showDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Page 이동'),
          content: const Text('아래의 버튼을 누르면 페이지를 이동합니다.'),
          actions: [
            // TextButton(
            //   onPressed: () {
            //     Navigator.of(ctx).pop();
            //   },
            //   child: const Text('종료'),
            //),
            ElevatedButton(onPressed:() {
              Navigator.pushNamed(context, '/2');              
            }, child: const Text('Page 이동'))
          ],
        );
      });
}
