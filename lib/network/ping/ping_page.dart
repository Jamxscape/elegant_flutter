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
  ValueNotifier<String> pingNum = ValueNotifier('');
  @override
  initState() {
    ping.stream.listen((PingData event) {
      pingNum.value = '${event.response?.time?.inMilliseconds}';
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
        child: ValueListenableBuilder<String>(
          valueListenable: pingNum,
          builder: (context, value, child) {
            return Text(value);
          },
        ),
      ),
    );
  }
}
