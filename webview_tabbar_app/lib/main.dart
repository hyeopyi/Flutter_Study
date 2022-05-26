import 'package:flutter/material.dart';
import 'package:webview_app/webpage.dart';


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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;
  final String naver = 'www.naver.com';
  final String daum = 'www.daum.net';
  final String google = 'www.google.com';

  @override
  void initState() {
    // 앱이 시작시 실행
    controller = TabController(length: 3, vsync: this);
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
        children: const [
          Webpage(siteName: 'www.naver.com'),
          Webpage(siteName: 'www.google.com'),
          Webpage(siteName: 'www.daum.net')
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          
          tabs: [
            Tab(
              icon: Image.asset('images/naver.jpeg',
              width: 30,
              height: 30,
              ),
              text: '네이버',   
            ),
            
            Tab(
              icon: Image.asset('images/google.png',
              width: 30,
              height: 30,
              ),
              text: '구글',   
            ),
            Tab(
              icon: Image.asset('images/daum.png',
               width: 30,
               height: 30,),              
              text: "다음",
            )
          ],
        ),
      ),
      
    );
  }
}
