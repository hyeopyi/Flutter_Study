import 'package:flutter/material.dart';

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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List imageName;
  late int currentImage;
  late int nextImage;
  late int prevImage;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentImage = 0;
    nextImage = 1;
    prevImage = imageName.length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName[currentImage]),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 10,
                        )),
                    child: Image.asset(
                      'images/${imageName[currentImage]}', // Image.Asset -> Container -> Padding -> Stack
                      width: 400,
                      height: 600,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 290,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.amber,
                      width: 5,
                    )),
                    child: Image.asset(
                      'images/${imageName[nextImage]}',
                      fit: BoxFit.fill,
                      width: 100,
                      height: 150,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 18,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.red,
                      width: 5,
                    )),
                    child: Image.asset(
                      'images/${imageName[prevImage]}',
                      fit: BoxFit.fill,
                      width: 100,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _prevImage, child: const Text('<< 이전')),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: _nextImage, child: const Text('다음 >>')),
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- Function
  _prevImage() {
    setState(() {
      currentImage -= 1;
      nextImage = currentImage + 1;
      prevImage = currentImage - 1;

      if (currentImage < 0) {
        currentImage = imageName.length - 1;
        nextImage = 0;
        prevImage = currentImage - 1;
      } else if (currentImage == 0) {
        prevImage = imageName.length - 1;
      }
    });
  }

  _nextImage() {
    setState(() {
      currentImage += 1;
      nextImage = currentImage + 1;
      prevImage = currentImage - 1;

      if (currentImage == imageName.length) {
        currentImage = 0;
        nextImage = currentImage + 1;
        prevImage = imageName.length - 1;
      } else if (currentImage == imageName.length - 1) {
        nextImage = 0;
      }
    });
  }
}
