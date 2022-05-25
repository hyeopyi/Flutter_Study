import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal/animal_item.dart';


class FirstPage extends StatefulWidget {
  final List<Animal> list;
  const FirstPage({Key? key, required this.list}) : super(key: key); // 생성자

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            // widget.list면 다른 클래스에 있는 list를 가져온다
            itemCount: widget.list.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  _showDialog(context, position);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text("     ${widget.list[position].animalName}"),
                    ],
                  ),
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
            title: Text(widget.list[position].animalName,
            style: const TextStyle(fontWeight: FontWeight.bold),),
            content: Text('이 동물은 ${widget.list[position].kind} 입니다.'),
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
} // End