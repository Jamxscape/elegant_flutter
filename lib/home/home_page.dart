import 'package:elegant_flutter/hardware/hardware_page.dart';
import 'package:elegant_flutter/navigation/navigation_page.dart';
import 'package:elegant_flutter/network/network_page.dart';
import 'package:elegant_flutter/picker/picker_page.dart';
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
        title: Text("主页"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('导航栏'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                // 目标页面，即一个 Widget
                return NavigationPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ), //---分割线的添加Divider()控件---
          ListTile(
            title: Text('选择框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return PickerPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ), //---分割线的添加Divider()控件---
          ListTile(
            title: Text('网络'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return NetworkPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ), //---分割线的添加Divider()控件---
          ListTile(
            title: Text('硬件'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return HardwarePage();
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
