import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // 입력받은 데이터를 message에 넣어서 전달하고 table_list에서 Add
  // List<TodoList> todoList를 만드는 순간 다른 변수
  late TextEditingController textEditingController;
  late bool purchaseValue;
  late bool primiseValue;
  late bool studyValue;
  late String path;

  @override
  void initState() {
    textEditingController = TextEditingController();
    purchaseValue = true;
    primiseValue = false;
    studyValue = false;
    path = "";
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('구매'),
                  Switch(
                      value: purchaseValue,
                      onChanged: (value) {
                        purchaseValue = value;
                        dicisionPurchase();
                      }),
                  Image.asset('images/cart.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('약속'),
                  Switch(
                      value: primiseValue,
                      onChanged: (value) {
                        primiseValue = value;
                        dicisionPrimise();
                      }),
                  Image.asset('images/clock.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('스터디'),
                  Switch(
                      value: studyValue,
                      onChanged: (value) {
                        studyValue = value;
                        dicisionStudy();
                      }),
                  Image.asset('images/pencil.png'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
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
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
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
  addList() {
    if (purchaseValue) {
      path = 'images/cart.png';
    } else if (primiseValue) {
      path = 'images/clock.png';
    } else if (studyValue) {
      path = 'images/pencil.png';
    }
    Message.imagePath = path;
    Message.workList = textEditingController.text;
    Message.action = true;
  }

  dicisionPurchase() {
    setState(() {
      if (purchaseValue) {
        purchaseValue;
        studyValue = false;
        primiseValue = false;
      } else {
        purchaseValue = true;
      }
    });
  }

  dicisionPrimise() {
    setState(() {
      if (primiseValue) {
        purchaseValue = false;
        studyValue = false;
        primiseValue;
      } else {
        purchaseValue = true;
        studyValue;
      }
    });
  }

  dicisionStudy() {
    if (studyValue) {
      setState(() {
        purchaseValue = false;
        primiseValue = false;
        studyValue;
      });
    } else {
      setState(() {
        purchaseValue = true;
        studyValue = false;
      });
    }
  }
} // End
