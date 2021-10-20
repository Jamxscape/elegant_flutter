import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:notustohtml/notustohtml.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';

/// 富文本框的具体内容
class RichTextReadOnlyPage extends StatelessWidget {
  final String text;
  RichTextReadOnlyPage({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('输出的文本内容为: $text');
    final converter = NotusHtmlCodec();

    Delta delta = converter.decode(text); // Zefyr compatible Delta
    NotusDocument document = NotusDocument.fromDelta(
        delta); // Notus document ready to be loaded into Zefyr

    ZefyrController _controller = ZefyrController(document);
    final FocusNode _focusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("富文本内容"),
      ),
      body: Container(
          child: ListView(
        children: [
          ZefyrEditor(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: false,
            readOnly: true,
            showCursor: false,
            // readOnly: true,
            // padding: EdgeInsets.only(left: 16, right: 16),
            // onLaunchUrl: _launchUrl,
          ),
        ],
      )),
    );
  }
}

/// ¶ ⟨Hhh⟩ ⏎
