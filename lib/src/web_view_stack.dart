import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_boilerplate/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, Key? key}) : super(key: key);

  final Completer <WebViewController> controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: devURL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            widget.controller.complete(webViewController);
          },
          // javascriptChannels: _createJavascriptChannels(context),
        )
      ],
    );
  }

  // Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
  //   return {
  //     JavascriptChannel(
  //         name: "JavaScriptChannel",
  //         onMessageReceived: (JavascriptMessage result) {
  //           String parameterString = result.message;
  //           List<String> parameter = parameterString.split(',');
  //
  //           Navigator.pushNamed(context, drawingRoute, arguments: parameter);
  //         }
  //     ),
  //   };
  // }
}