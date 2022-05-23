import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Swipe extends StatefulWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  State<Swipe> createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  // Property
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('이미지 변경하기'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          // Center에서
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 350,
                height: 600,
              )
            ],
          ),
        ),
      ),
    );
  }

  // -- Function
  _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.down) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }
}
