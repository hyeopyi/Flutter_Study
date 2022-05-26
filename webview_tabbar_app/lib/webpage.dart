import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webpage extends StatefulWidget {
  final String siteName;
  const Webpage({Key? key, required this.siteName}) : super(key: key);

  @override
  State<Webpage> createState() => _WebpageState();
}

class _WebpageState extends State<Webpage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('WebView - Tabbar')
      ),
      body: Stack(
        // 한 화면에 Web을 계속 쌓아서 사용(z 좌표로 쌓인다)
        children: [
          WebView(
            initialUrl: 'https://${widget.siteName}',
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [                  
                  FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        controller.data!.goBack();                   
                      },
                      child: const Icon(Icons.arrow_back)),
                      
                ],
              );
                  
            }


            return Stack();
          }),
          
          
    );
  }


} // End