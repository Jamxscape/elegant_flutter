/// 不能转成HTML
import 'dart:convert';

import 'package:elegant_flutter/textfield/multiple_text/rich_text_display_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notustohtml/notustohtml.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zefyr/zefyr.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  ZefyrController _controller = ZefyrController(NotusDocument()..insert(0, ''));
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("富文本编辑框"),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 500,
              child: _buildWelcomeEditor(context),
            ),
            TextButton(
              onPressed: () {
                final converter = NotusHtmlCodec();

                String html = converter.encode(_controller.document.toDelta());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return RichTextDisplayPage(text: html);
                  }),
                );
              },
              child: Text("保存"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeEditor(BuildContext context) {
    return Column(
      children: [
        ZefyrToolbar.basic(controller: _controller),
        Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: ZefyrEditor(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              // readOnly: true,
              // padding: EdgeInsets.only(left: 16, right: 16),
              // onLaunchUrl: _launchUrl,
            ),
          ),
        ),
      ],
    );
  }
}
