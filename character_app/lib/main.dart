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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/Lee.jpg'),
                  radius: 70,
                ),
              )
            ],
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
            thickness: 1.5,
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '성웅',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '이순신 장군',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '전적',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                child: Text(
                  '62전 62승',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text(
                      '옥포해전',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text('사천포해전',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text('당포해전',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text('한산도대첩',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text('부산포해전', 
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text('명량해전',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Icon(Icons.check_circle_outline_rounded),
                  ),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 3),
                    child: Text('노량해전',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('images/turtle.gif'),
                backgroundColor: Colors.transparent,
                radius: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
