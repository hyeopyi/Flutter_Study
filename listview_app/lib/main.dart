import 'package:flutter/material.dart';
import 'package:listview_app/animal_item.dart';
import 'package:listview_app/first_page.dart';
import 'package:listview_app/second_page.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // tab bar를 위한 추가상속
  // Property
  late TabController controller;
  List<Animal> animalList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList.add(Animal(
        imagePath: 'images/bee.png',
        animalName: '벌',
        kind: '곤충',
        flyExist: true));

    animalList.add(Animal(
        imagePath: 'images/cat.png',
        animalName: '고양이',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/cow.png',
        animalName: '젖소',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/dog.png',
        animalName: '강아지',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/fox.png',
        animalName: '여우',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/pig.png',
        animalName: '돼지',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/monkey.png',
        animalName: '원숭이',
        kind: '포유류',
        flyExist: false));

    animalList.add(Animal(
        imagePath: 'images/fox.png',
        animalName: '늑대',
        kind: '포유류',
        flyExist: false));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal List'),
      ),
      body: TabBarView(controller: controller, children: [
        FirstPage(list: animalList),  // 생성자에 전달
        SecondPage(list: animalList), // 생성자에 전달
      ]),
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: TabBar(                 
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
              text: "List",
            ),
             Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
