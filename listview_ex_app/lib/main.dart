import 'package:flutter/material.dart';
import 'package:listview_ex_app/contry.dart';
import 'package:listview_ex_app/first_page.dart';
import 'package:listview_ex_app/second_page.dart';

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
  // Property
  late TabController controller;
  List<Contry> contryList = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    contryList.add(Contry(contryName: '오스트리아', imagePath: 'images/austria.png'));
    contryList.add(Contry(contryName: '벨기에', imagePath: 'images/belgium.png'));
    contryList.add(Contry(contryName: '에스토니아', imagePath: 'images/estonia.png'));
    contryList.add(Contry(contryName: '프랑스', imagePath: 'images/france.png'));
    contryList.add(Contry(contryName: '독일', imagePath: 'images/germany.png'));
    contryList.add(Contry(contryName: '헝가리', imagePath: 'images/hungary.png'));
    contryList.add(Contry(contryName: '이탈리아', imagePath: 'images/italy.png'));
    contryList.add(Contry(contryName: '라트비아', imagePath: 'images/latvia.png'));
    contryList.add(Contry(contryName: '리투아니아', imagePath: 'images/lithuania.png'));
    contryList.add(Contry(contryName: '룩셈브루크', imagePath: 'images/luxemburg.png'));
    contryList.add(Contry(contryName: '네덜란드', imagePath: 'images/netherland.png'));
    contryList.add(Contry(contryName: '루마니아', imagePath: 'images/romania.png'));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('국가명 맞추기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(contryList: contryList),
          SecondPage(ContryList: contryList),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
