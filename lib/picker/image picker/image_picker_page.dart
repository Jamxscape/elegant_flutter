import 'package:elegant_flutter/picker/image%20picker/head%20portrait/head_portrait_image_picker_page.dart';
import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/wechat_assets_picker_page.dart';
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
        title: Text("图片选择框"),
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
          ListTile(
            title: Text('头像选择'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return HeadPortraitPickerPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('微信类型的图片选择'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return WechatAssetsPickerPage();
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
