import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late int? clickCard;
  final int divNum = 3;
  @override
  void initState() {
    data = [];
    super.initState();
    getJSONData();
    clickCard = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Movie'),
      ),
      body: Center(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length ,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          clickCard = index;
                        });
                      },
                     
                      child: Card(
                         color: index == clickCard ? Colors.blue : Colors.white,                         
                        child: Row(
                          children: [ 
                            
                                                           
                            Image.network(
                              data[index]['image'],
                              height: 110,
                              width: 110,
                            ),
                            Text(data[index]['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }

  // --- Function ---
  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      data.addAll(result);
      clickCard = data.length + 1;
    });

    //print(data[0]['image']);
    return true;
  } 

 


} // End
