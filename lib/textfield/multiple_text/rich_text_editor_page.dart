import 'dart:convert';
import 'dart:io';

import 'package:elegant_flutter/textfield/multiple_text/rich_text_display_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notustohtml/notustohtml.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zefyr/zefyr.dart';
import 'package:image_picker/image_picker.dart';

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
        /// 先更改这儿的状态栏
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

              /// 更改这儿的文本框内的具体内容 从而显示图片
              embedBuilder: defaultZefyrEmbedBuilder,
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

class CustomInsertImageButton extends StatelessWidget {
  final ZefyrController controller;
  final IconData icon;

  const CustomInsertImageButton({
    Key? key,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  // Future<String> upload(File imageFile) async {
  //     // open a bytestream
  //     var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //     // get file length
  //     var length = await imageFile.length();

  //     // string to uri
  //     var uri = Uri.parse(server + "/upload");

  //     // create multipart request
  //     var request = http.MultipartRequest("POST", uri);

  //     // multipart that takes file
  //     var multipartFile = http.MultipartFile('note', stream, length,
  //         filename: basename(imageFile.path));

  //     // add file to multipart
  //     request.files.add(multipartFile);

  //     // send
  //     var response = await request.send();
  //     // listen for response.join()
  //     return response.stream.transform(utf8.decoder).join();
  //   }

  Future<String?> pickImage(ImageSource gallerySource) async {
    var image =
        await ImagePicker().pickImage(source: gallerySource, imageQuality: 50);
  }

  @override
  Widget build(BuildContext context) {
    return ZIconButton(
      highlightElevation: 0,
      hoverElevation: 0,
      size: 32,
      icon: Icon(
        icon,
        size: 18,
        color: Theme.of(context).iconTheme.color,
      ),
      fillColor: Theme.of(context).canvasColor,
      onPressed: () async {},
    );
  }
}

Widget defaultZefyrEmbedBuilder(BuildContext context, EmbedNode node) {
  if (node.value.type == 'hr') {
    final theme = ZefyrTheme.of(context)!;
    return Divider(
      height: theme.paragraph.style.fontSize! * theme.paragraph.style.height!,
      thickness: 2,
      color: Colors.grey.shade200,
    );
  }
  throw UnimplementedError(
      'Embeddable type "${node.value.type}" is not supported by default embed '
      'builder of ZefyrEditor. You must pass your own builder function to '
      'embedBuilder property of ZefyrEditor or ZefyrField widgets.');
}
