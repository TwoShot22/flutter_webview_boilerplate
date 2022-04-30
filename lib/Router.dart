import 'package:flutter/material.dart';
import 'package:flutter_webview_boilerplate/constants.dart';

import 'main.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case webViewRoute:
        return MaterialPageRoute(builder: (_) => const WebViewApp());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}