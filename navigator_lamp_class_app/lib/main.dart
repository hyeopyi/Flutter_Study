import 'package:flutter/material.dart';
import 'package:navigator_lamp_class_app/change.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  late String imagePath;
  late bool lampOnOff;

  @override
  void initState() {
    imagePath = 'images/lamp_on.png';
    lampOnOff = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main 화면'),
          actions: [
            IconButton(
                onPressed: () {
          
                  Navigator.push( // push 생성, pop 삭제
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Change(textMsg: controller.text, lampOnOff: lampOnOff);
                    }),
                  ).then((value) => getData(value));
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: '글자를 입력하세요',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Image.asset(
                  imagePath,
                  width: 150,
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Function ---
  getData(value) {
    setState(() {
     controller.text = value[0];
     if(value[1]){
       imagePath = 'images/lamp_on.png';
     }else{
       imagePath = 'images/lamp_off.png';
       lampOnOff = value[1];
     }
    });
  }
} // End
