import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 微信类型的图片选择
class SingleWechatAssetsPickerPage extends StatefulWidget {
  @override
  _SingleWechatAssetsPickerPageState createState() =>
      _SingleWechatAssetsPickerPageState();
}

class _SingleWechatAssetsPickerPageState
    extends State<SingleWechatAssetsPickerPage> {
  late List<AssetEntity>? assets = <AssetEntity>[];

  @override
  void initState() {
    super.initState();
  }

  Future<void> selectAssets() async {
    List<AssetEntity>? assetsTemp = await AssetPicker.pickAssets(
      context,
      maxAssets: 1,
      requestType: RequestType.image,
    );
    setState(() {
      assets = assetsTemp;
    });
    print("长度${assets!.length}");
  }

  Future<void> previewAssets(BuildContext context, int index) async {
    List<AssetEntity>? preview = await AssetPickerViewer.pushToViewer(
      context,
      currentIndex: index,
      previewAssets: assets!,
      themeData: AssetPicker.themeData(Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择框"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  selectAssets();
                });
              },
              child: Text("选择照片")),
          assets!.length != 0
              ? Container(
                  height: 600,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: assets!.length,
                      itemBuilder: (BuildContext c, int index) {
                        return Container(
                          child: TextButton(
                              onPressed: () {
                                previewAssets(context, index);
                              },
                              child: Image(
                                image: AssetEntityImageProvider(assets![index],
                                    isOriginal: false),
                                fit: BoxFit.cover,
                              )),
                        );
                      }))
              : Text("未选择照片"),
        ],
      ),
    );
  }
}
