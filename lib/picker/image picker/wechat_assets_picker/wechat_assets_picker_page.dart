import 'package:elegant_flutter/picker/image%20picker/head%20portrait/head_portrait_image_picker_page.dart';
import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/multiple_wechat_assets_picker_page.dart';
import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/single_wechat_assets_picker_page.dart';
import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/wechat_assets_picker_page.dart';
import 'package:flutter/material.dart';

/// 各种各样的图片选择框
class WechatAssetsPickerPage extends StatelessWidget {
  WechatAssetsPickerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微信类型的相册选择框"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('单张图片选择'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return SingleWechatAssetsPickerPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('多个图片选择'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return MultipleWechatAssetsPickerPage();
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
