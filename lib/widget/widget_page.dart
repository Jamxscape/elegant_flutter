import 'package:elegant_flutter/widget/button/button_page.dart';
import 'package:elegant_flutter/widget/textfield/textfield_page.dart';
import 'package:flutter/material.dart';

/// 常用组件
class WidgetPage extends StatelessWidget {
  WidgetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用组件"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('文本框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return TextFieldPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('按钮'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return ButtonPage();
              }),
            ),
          ),
        ],
      )),
    );
  }
}
