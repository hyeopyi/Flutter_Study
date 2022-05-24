import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // 입력받은 데이터를 message에 넣어서 전달하고 table_list에서 Add
  // List<TodoList> todoList를 만드는 순간 다른 변수
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: (){
                  if(textEditingController.text.trim().isNotEmpty){
                    addList();
                  }
                  Navigator.pop(context);
              }, 
              child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // --- Function ---
  addList(){
    Message.imagePath = 'images/pencil.png';
    Message.workList = textEditingController.text;
    Message.action = true;
  }
} // End
