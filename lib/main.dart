import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  // iOS Ping的设置
  DartPingIOS.register();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
