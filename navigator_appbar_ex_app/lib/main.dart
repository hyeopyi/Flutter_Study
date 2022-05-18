import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/email1st.dart';
import 'package:navigator_appbar_ex_app/email2nd.dart';
import 'package:navigator_appbar_ex_app/screen.dart';

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
        '/' :(context) => const Screen(),
        '/SendEmail' :(context) => const Email1st(),
        '/ReceivedEmail' :(context) => const Email2nd(),

      },
      initialRoute:  '/',
    );
  }
}

