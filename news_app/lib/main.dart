/*
File : Main App
Description : The main file which run the whole app
*/

import 'package:flutter/material.dart';
import 'package:news_app/views/splash_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = AndroidWebViewPlatform();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
