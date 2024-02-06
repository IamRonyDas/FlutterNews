import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class article extends StatefulWidget {
  final String blogUrl;
  article({required this.blogUrl, required String imageUrl});
  @override
  State<article> createState() => _articleState();
}

class _articleState extends State<article> {
  final Completer<InAppWebViewController> completer =
      Completer<InAppWebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue[400]),
            )
          ],
        ),
        
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.blogUrl),
            ),
            onWebViewCreated: (InAppWebViewController webViewController) {
              completer.complete(webViewController);
            },
          )
          ),
    );
  }
}
