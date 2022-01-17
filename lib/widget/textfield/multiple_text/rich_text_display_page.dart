import 'package:flutter/material.dart';

import 'rich_text_read_only_page.dart';

/// 富文本框的具体内容
class RichTextDisplayPage extends StatelessWidget {
  final String text;
  RichTextDisplayPage({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('输出的文本内容为: $text');
    return Scaffold(
      appBar: AppBar(
        title: Text("输入完成的详细内容"),
      ),
      body: Container(
          child: ListView(
        children: [
          Text(text),
          TextButton(
              child: Text("展示文档格式"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return RichTextReadOnlyPage(text: text);
                  }),
                );
              }),
        ],
      )),
    );
  }
}

/// ¶ ⟨Hhh⟩ ⏎
