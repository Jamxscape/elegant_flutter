import 'package:elegant_flutter/textfield/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

import 'multiple_text/rich_text_editor_page.dart';

/// 文本框
class TextFieldPage extends StatelessWidget {
  TextFieldPage({
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
        children: [
          ListTile(
            title: Text('搜索框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return SearchBarTestView();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('富文本框/转换成HTML格式的存储'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return EditorPage();
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
