import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 微信类型的图片选择
class WechatAssetsPickerPage extends StatefulWidget {
  @override
  _WechatAssetsPickerPageState createState() => _WechatAssetsPickerPageState();
}

class _WechatAssetsPickerPageState extends State<WechatAssetsPickerPage> {
  late List<AssetEntity> assets = <AssetEntity>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择框"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                assets = (await AssetPicker.pickAssets(context))!;
              },
              child: Text("选择照片")),
          assets.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: assets.length,
                  itemBuilder: (BuildContext c, int index) {
                    return Container(
                        child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image(
                        image: AssetEntityImageProvider(assets[index],
                            isOriginal: false),
                        fit: BoxFit.cover,
                      ),
                    ));
                  })
              : Text("未选择照片"),
        ],
      ),
    );
  }
}
