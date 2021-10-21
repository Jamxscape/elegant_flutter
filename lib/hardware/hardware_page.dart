import 'package:elegant_flutter/hardware/compass/compass.dart';
import 'package:flutter/material.dart';

/// 各种硬件使用的例子
class HardwarePage extends StatelessWidget {
  HardwarePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("硬件使用案例"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('指南针/罗盘'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return CompassPage();
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
