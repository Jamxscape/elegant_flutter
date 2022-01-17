import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class RichTextPage extends StatelessWidget {
  RichTextPage({Key? key}) : super(key: key);

  final HtmlEditorController _htmlEditorController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航栏"),
      ),
      body: HtmlEditor(
        controller: _htmlEditorController,
        htmlEditorOptions: HtmlEditorOptions(
          initialText: '',
          adjustHeightForKeyboard: true,
          autoAdjustHeight: true,
          hint: '请输入执行内容',
          shouldEnsureVisible: true,
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
            toolbarType: ToolbarType.nativeExpandable,
            defaultToolbarButtons: const [
              StyleButtons(),
              FontSettingButtons(fontSizeUnit: false),
              FontButtons(clearAll: false),
              ColorButtons(),
              ListButtons(listStyles: false),
              ParagraphButtons(
                  textDirection: false,
                  lineHeight: false,
                  caseConverter: false),
              InsertButtons(
                video: false,
                audio: false,
                table: false,
                hr: false,
                link: false,
                otherFile: false,
              ),
            ],
            onButtonPressed:
                (ButtonType buttonType, bool? _, void Function()? __) async {
              if (buttonType == ButtonType.picture) {
                // String? url = await _imagePick(context);
                // if (url != null) {
                //   _htmlEditorController.insertNetworkImage(url);
                // }
                // return false;
              }
              return true;
            }),
      ),
    );
  }
}
