import 'package:flutter/material.dart';

/// 主页面
class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("实验报告"),
      ),
      body: Container(child: Text("hello, world")),
    );
  }
}
