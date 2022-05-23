
import 'package:bmi_team_tabbar_app/1/startPage.dart';
import 'package:bmi_team_tabbar_app/2/main2.dart';
import 'package:bmi_team_tabbar_app/5/first.dart';
import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> 
    with SingleTickerProviderStateMixin {

  // Property
  late TabController controller;
  @override
  void initState() {
    // 앱이 시작시 실행
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // 앱이 종료될때 실행
    controller.dispose(); // 중간에 정리할 타이밍이 없어 앱이 종료할때 정리
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [StartPage(), MyHomePage(), FirstPage()],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellowAccent,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
              text: "1",
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
              text: "2",
            ),
            Tab(
              icon: Icon(
                Icons.looks_3,
                color: Colors.red,
              ),
              text: "3",
            ),

          ],
          ),
      ),
    );
  }
}
