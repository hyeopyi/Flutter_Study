import 'package:flutter/material.dart';
import 'package:listview_todo_app/message.dart';

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
        title: Text(Messgae.workList),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Messgae.imagePath),
            const SizedBox(height: 50,),
            Text(
              Messgae.workList
            ),
          ],
        ) 
        ),



    );
    
  }
}