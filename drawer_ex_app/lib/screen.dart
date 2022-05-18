import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/send');
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/received');
            },
            icon: const Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/send');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text('보낸편지함')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/received');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text('받은편지함')),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(backgroundImage: AssetImage('images/pikachu-2.jpg')),
                CircleAvatar(backgroundImage: AssetImage('images/pikachu-3.jpg')),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/send');
              },
              leading: const Icon(
                Icons.email,
                color: Colors.black,
              ),
              title: const Text('보낸편지함'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/received');
              },
              leading: const Icon(
                Icons.email,
                color: Colors.black,
              ),
              title: const Text('받은편지함'),
            ),
          ],
        ),
      ),
    );
  }
}
