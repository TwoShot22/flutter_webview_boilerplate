import 'dart:async';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_webview_boilerplate/Router.dart';
import 'package:flutter_webview_boilerplate/constants.dart';
import 'package:flutter_webview_boilerplate/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const WebViewBoilerPlateApp());
}

class WebViewBoilerPlateApp extends StatelessWidget {
  const WebViewBoilerPlateApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: webViewRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewStack(controller: controller),
      ),
    );
  }
}