import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'resources',
      home: Scaffold(
        appBar: AppBar(
          title: Text('our resources'),
        ),
        body: WebView(
          initialUrl: "https://www.moh.gov.om/ar/1",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
