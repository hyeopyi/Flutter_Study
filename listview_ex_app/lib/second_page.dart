import 'package:flutter/material.dart';
import 'package:listview_ex_app/contry.dart';

class SecondPage extends StatefulWidget {
  final List<Contry> ContryList;
  const SecondPage({Key? key, required this.ContryList}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: const InputDecoration(labelText: '정답을 입력하세요'),
              ),
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    'images/korea.png',
                    width: 80,
                  ),
                  Image.asset(
                    'images/france.png',
                    width: 80,
                  ),
                    Image.asset(
                    'images/usa.png',
                    width: 80,
                  ),
     
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
