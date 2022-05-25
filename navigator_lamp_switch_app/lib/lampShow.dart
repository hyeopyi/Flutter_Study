import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/lampStatus.dart';

class LampShow extends StatefulWidget {
  const LampShow({Key? key}) : super(key: key);

  @override
  State<LampShow> createState() => _LampShowState();
}

class _LampShowState extends State<LampShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context,'/2').then((value) => getdata());
            },
            icon: const Icon(Icons.note),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 170,
            ),
            SizedBox(
                width: 200,
                height:400,
                child: Column(
                  children: [
                    Image.asset(LampStatus.imagePath,
                    fit: BoxFit.contain,),
                  ],
                )),
          ],
        ),
      ),
    );
  }


  // --- Function ---
  getdata(){
    setState(() {
      LampStatus.imagePath;
    });
  }
} // End
