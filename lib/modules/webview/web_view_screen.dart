import 'package:flutter/material.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen(this.url);
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
        // onProgress: (progress) => myDivider(),
      ),
      // WebView(
      //   initialUrl: 'url',
      // ),
    );
  }
}
