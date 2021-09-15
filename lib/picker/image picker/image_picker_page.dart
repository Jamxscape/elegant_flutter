import 'package:flutter/material.dart';

import 'default_image_picker_page.dart';
import 'flutter_image_picker_page.dart';

/// 各种各样的图片选择框
class ImagePickerPage extends StatelessWidget {
  ImagePickerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择框"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('默认图片选择框，包含筛选图片'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return DefaultImagePickerPage(
                  title: "默认选择框",
                );
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('单张图片选择框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return FlutterImagePickerPage(
                  title: "单张图片选择框",
                );
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
