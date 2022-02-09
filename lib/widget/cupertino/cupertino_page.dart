import 'package:flutter/material.dart';

class CupertinoPage extends StatefulWidget {
  const CupertinoPage({Key? key}) : super(key: key);

  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('iOS风格')),
        body: Container(
            child: ListView(children: [
          TextButton(onPressed: () {}, child: Text('iOS底部弹出框')),
        ])));
  }
}
