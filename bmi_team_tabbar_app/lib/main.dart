import 'package:bmi_team_tabbar_app/1/calPage.dart';
import 'package:bmi_team_tabbar_app/1/resultPage.dart';
import 'package:bmi_team_tabbar_app/1/startPage.dart';
import 'package:bmi_team_tabbar_app/2/main2.dart';
import 'package:bmi_team_tabbar_app/3/bmiinsert.dart';
import 'package:bmi_team_tabbar_app/3/bmiresult.dart';
import 'package:bmi_team_tabbar_app/3/home.dart';
import 'package:bmi_team_tabbar_app/4/bmi_result.dart';
import 'package:bmi_team_tabbar_app/4/screen4.dart';
import 'package:bmi_team_tabbar_app/5/first.dart';
import 'package:bmi_team_tabbar_app/5/second.dart';
import 'package:bmi_team_tabbar_app/teamscreen.dart';
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
      routes: {
        '/' :(context) => const TeamScreen(),
        "startPage" :(context) => const StartPage(),
        "/calPage" :(context) => const CalPage(),
        "resultPage" :(context) => const ResultPage(),
        '/2' :(context) => const MyHomePage(),
        '/5_1' :(context) => const FirstPage(),
        '/5_2' :(context) => const SecondPage(),
        '/3' :(context) => const Home(),
        'bmiinsert' :(context) => const BmiInsert(),
        'bmiresult' :(context) => const BmiResult(),
        '/4': (context) => const First4(),
        '/4_second': (context) => const Second4(),
      },
      initialRoute:  '/',
    );
  }
}