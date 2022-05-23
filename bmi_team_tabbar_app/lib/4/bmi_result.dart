import 'package:bmi_team_tabbar_app/4/message4.dart';
import 'package:flutter/material.dart';

class Second4 extends StatelessWidget {
  const Second4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('BMI 결과'),
        backgroundColor: Colors.black,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' ${Message4.msg}',
               style: const TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
            )),
            Image.asset(
                'images/smile.png',
                width: 80,
                height: 80,
              ),
            
            
          ],
        ),
      ),
      
    );
    
  }
}
