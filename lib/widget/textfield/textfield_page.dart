import 'package:flutter/material.dart';

import 'multiple_text/rich_text_editor_page.dart';
import 'numberic_textfield/numberic_textfield_page.dart';
import 'read_only_textfield_page.dart';
import 'rich_text/rich_text_page.dart';
import 'search_bar/search_bar.dart';
import 'textfield_style/commom_textfield_style.dart';

/// 文本框
class TextFieldPage extends StatelessWidget {
  TextFieldPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
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
          ListTile(
            title: Text('只读'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return ReadOnlyTextFieldPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('富文本HTML'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return RichTextPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('特殊类型输入框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return NumbericTextFieldPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('常用输入框样式'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return CommonTextfieldStyle();
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
