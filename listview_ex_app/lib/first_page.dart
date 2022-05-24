import 'package:flutter/material.dart';
import 'package:listview_ex_app/contry.dart';

class FirstPage extends StatefulWidget {
  final List<Contry> contryList;
  const FirstPage({Key? key, required this.contryList}) : super(key: key); // 생정자에 required 적용

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: widget.contryList.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: (){
                  _showDialog(context, position);
                },
                child: Card(
                  child: Row(children: [
                    Image.asset(
                      widget.contryList[position].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(
                        "    ${widget.contryList[position].contryName[0]}_______"),
                  ]),
                ),
              );
            }),
      ),
    );
  }

  // -- Functions
  _showDialog(BuildContext context, int position) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('국가명',
            style: TextStyle(fontWeight: FontWeight.bold),),
            content: Text('이 국기는 ${widget.contryList[position].contryName}의 국기 입니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('종료'))
            ],
          );
        });
  }
}
