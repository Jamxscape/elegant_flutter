import 'package:elegant_flutter/network/ping/ping_page.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:flutter/material.dart';

/// 各种各样的网络问题汇总
class NetworkPage extends StatelessWidget {
  NetworkPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('PING'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return PingPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
        ],
      )),
    );
  }
}
