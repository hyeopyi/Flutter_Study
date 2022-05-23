import 'package:flutter/material.dart';
import 'package:listview_todo_app/detail_list.dart';
import 'package:listview_todo_app/message.dart';
import 'package:listview_todo_app/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: "책구매"));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: "철수와 약속"));
    todoList.add(TodoList(imagePath: 'images/pencil.png', workList: "스터디 준비하기"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            // 스크롤도 자동으로 됨
            itemCount: todoList.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: GestureDetector(
                  onTap: () {
                    Messgae.imagePath = todoList[position].imagePath;
                    Messgae.workList = todoList[position].workList;  // position이 어디를 클릭했는지 넘겨준다
                    
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) =>  const DetailList(),));
                  },
                  child: Card(
                    color: position % 2 == 0
                        ? const Color.fromARGB(200, 100, 100, 200)
                        : Colors.red,
                    child: Row(
                      children: [
                        Image.asset(
                          todoList[position].imagePath,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(todoList[position].workList)
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
