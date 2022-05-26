import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName = 'www.daum.net';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Column(
            children: [
              const Text('WebView'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        setState(() {
                          siteName = 'www.google.com';
                        });
                        _reloadSite();
                      },
                      child: const Text('Google')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {
                        setState(() {
                          siteName = 'www.naver.com';
                        });
                        _reloadSite();
                      },
                      child: const Text('Naver')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          siteName = 'www.daum.net';
                        });
                        _reloadSite();
                      },
                      child: const Text('Daum')),
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Stack(
        // 한 화면에 Web을 계속 쌓아서 사용(z 좌표로 쌓인다)
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted, // 제한없이 쓸수있게 설정
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),  // 로딩중이면 인디게이터를 보여주고 아니면 스택으로 돌아간다
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            // 어떤화면에서 클릭했는지 기억
            if (controller.hasData) {
              return FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    controller.data!.goBack();
                  },
                  child: const Icon(Icons.arrow_back));
            }
            return Stack();
          }),
    );
  }

  // --- Function ---
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
} // End
