import 'package:flutter/material.dart';

/// 各种各样的导航栏
class NavigationPage extends StatelessWidget {
  NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航栏"),
      ),
      body: Container(
          child: ListView(
        children: [],
      )),
    );
  }
}
