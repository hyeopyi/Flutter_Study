import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Messgae.cols,

      appBar: AppBar(
        title: const Text('MessageworkList'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Message.imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.fill, // 사이즈를 정하고 크기할당
          ),
          const SizedBox(
            height: 50,
          ),
          Text(Message.workList),
        ],
      )),
    );
  }
}
