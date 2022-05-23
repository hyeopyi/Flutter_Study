import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/button.dart';
import 'package:tabbar_image_ex_app/swipe.dart';

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
        primarySwatch: Colors.yellow,
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
    with SingleTickerProviderStateMixin{
      
  // Property
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [Button(), Swipe()]
        ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.blue,
        tabs: const[
          Tab(
            icon: Icon(Icons.badge,
            color: Colors.blue,
            ),
            text: 'Button',
          ),
          Tab(
            icon: Icon(Icons.computer,
            color: Colors.red,
            ),
            text: 'Swipe',
          ),
          
        ]
        ),
    );
    
  }
}