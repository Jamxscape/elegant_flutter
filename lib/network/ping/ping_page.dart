import 'dart:developer';

import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';

/// 各种各样的网络问题汇总
class PingPage extends StatefulWidget {
  PingPage({Key? key}) : super(key: key);

  @override
  _PingPageState createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  final ping = Ping('baidu.com');

  /// 转换成微秒
  String pingNum = '0';

  /// ping原始数据
  String pingData = '';
  @override
  initState() {
    ping.stream.listen((PingData event) {
      setState(() {
        pingNum = '${event.response!.time!.inMicroseconds}';
        pingData = '$event';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PING"),
      ),
      body: Container(
        child: Column(
          children: [
            Text('$pingNum us'),
            Text('$pingData'),
          ],
        ),
      ),
    );
  }
}
