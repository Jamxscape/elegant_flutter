import 'package:elegant_flutter/textfield/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

import 'multiple_text/rich_text_editor_page.dart';

/// 文本框
class ReadOnlyTextFieldPage extends StatelessWidget {
  ReadOnlyTextFieldPage({
    Key? key,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.text = "在孤独与";
    return Scaffold(
        appBar: AppBar(
          title: Text("只读类型输入框"),
        ),
        body: Container(
            child: TextField(
          controller: controller,
          readOnly: true,
        )));
  }
}
