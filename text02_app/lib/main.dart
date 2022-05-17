import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const H(),
    );
  }
}
class H extends StatelessWidget {
  const H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title:  const Text('Text with Coulmn and Row'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [                
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_rounded),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_balance),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle, color: Colors.blue,),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("James"),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Cathy"),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Kenny"),
                ),
             ],
            )
          ],
        ),
      ),

    );
    
  }
}