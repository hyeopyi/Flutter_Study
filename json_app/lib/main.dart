import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // alias 설정을 해줘야 한다

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = []; // 빈 리스트로 설정
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
          // 로딩중 아이콘을 센터에 두기위해서 안드로이드는 센터가 없을 경우 좌상단에 위치
          child: data.isEmpty
              ? const Text('데이터가 없습니다.')
              //const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Code :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['code'],
                                ),
                              ],
                            ),
                            const SizedBox(height: 7,),
                            Row(
                              children: [
                                const Text(
                                  'Name :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['name'],
                                ),
                              ],
                            ),
                            const SizedBox(height: 7,),
                            Row(
                              children: [
                                const Text(
                                  'Dept :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['dept'],
                                ),
                              ],
                            ),
                            const SizedBox(height: 7,),
                            Row(
                              children: [
                                const Text(
                                  'Phone :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['phone'],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }

  // --- Function ---
  Future<bool> getJSONData() async { // Future, async, await 는 한 세트로
    // 비동기 함수로 생성
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_query_flutter.jsp'); // web만 post방식을 사용 나머지는 get방식 사용 - 자체 암호화를 위해
    var response = await http.get(url); // 데이터를 가져와서 빌드가 끝날때까지 대기

    setState(() {
      // 화면 구성이 바뀌어야 쓴다
      var dataConvertedJSON =
          json.decode(utf8.decode(response.bodyBytes)); // utf-8 타입으로 하나씩 변환
      List result = dataConvertedJSON['results'];
      data.addAll(result);
    });
    //print(result);
    print(data[0]['code']);
    return true;  // return을 하지만 쓰지않는다
  }
} // End