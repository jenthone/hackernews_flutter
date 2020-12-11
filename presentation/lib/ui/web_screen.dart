import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../config/color.dart';

class WebScreen extends HookWidget {
  final String _url;

  WebScreen(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: WebView(
        initialUrl: _url,
      ),
    );
  }
}
