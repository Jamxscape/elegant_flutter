import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

/// 微信类型的图片选择
class WechatTakePhotoPage extends StatefulWidget {
  @override
  _WechatTakePhotoPageState createState() => _WechatTakePhotoPageState();
}

class _WechatTakePhotoPageState extends State<WechatTakePhotoPage> {
  late List<AssetEntity>? assets = <AssetEntity>[];

  @override
  void initState() {
    super.initState();
  }

  Future<void> takePhoto(BuildContext context) async {
    final AssetEntity? assetTemp =
        await CameraPicker.pickFromCamera(context, enableRecording: true);
    setState(() {
      if (assetTemp != null) {
        assets!.add(assetTemp);
      }
    });
    print("长度${assets!.length}");
    String path = '';
    await getDatabasesPath().then((result) {
      path = result;
    });
    final File? originFile = await assetTemp!.originFile; // 原图或者原视频
    if (originFile != null) {
      final Uint8List byteData = await originFile.readAsBytes();
      if (path != '') {
        File saveFile = File('$path/${assetTemp.title}');
        saveFile.writeAsBytes(byteData);
        log('文件保存成功');
      } else {
        log('文件保存失败');
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
        title: Text("选择框"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  takePhoto(context);
                });
              },
              child: Text("拍摄照片")),
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
