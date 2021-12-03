import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 微信类型的多个图片选择
class MultipleWechatAssetsPickerPage extends StatefulWidget {
  @override
  _MultipleWechatAssetsPickerPageState createState() =>
      _MultipleWechatAssetsPickerPageState();
}

class _MultipleWechatAssetsPickerPageState
    extends State<MultipleWechatAssetsPickerPage> {
  late List<AssetEntity>? assets = <AssetEntity>[];

  @override
  void initState() {
    super.initState();
  }

  Future<void> selectAssets(BuildContext context) async {
    List<AssetEntity>? assetsTemp = await AssetPicker.pickAssets(
      context,
      maxAssets: 9,
      requestType: RequestType.common,
    );
    setState(() {
      if (assetsTemp != null) {
        assets = assetsTemp;
      }
    });
    print("长度${assets!.length}");
    String path = '';
    await getDatabasesPath().then((result) {
      path = result;
    });
    for (int i = 0; i < assetsTemp!.length; i++) {
      final File? originFile = await assetsTemp[i].originFile; // 原图或者原视频
      if (originFile != null) {
        final Uint8List byteData = await originFile.readAsBytes();
        if (path != '') {
          File saveFile = File('$path/${assetsTemp[i].title}');
          saveFile.writeAsBytes(byteData);
          log('文件保存成功');
        } else {
          log('文件保存失败');
        }
      }
    }
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
        title: Text("多个图片选择框"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  selectAssets(context);
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
                            child: Column(children: [
                              Image(
                                image: AssetEntityImageProvider(assets![index],
                                    isOriginal: false),
                                fit: BoxFit.cover,
                              ),
                              Text(assets![index].title!),
                            ]),
                          ),
                        );
                      }))
              : Text("未选择照片"),
        ],
      ),
    );
  }
}
