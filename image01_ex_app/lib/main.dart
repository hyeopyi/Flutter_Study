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
      theme: ThemeData(),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: const Text('Image Ex01'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-1.jpg'),
                    radius: 50,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 3, 10, 3),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-2.jpg'),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-3.jpg'),
                    radius: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
