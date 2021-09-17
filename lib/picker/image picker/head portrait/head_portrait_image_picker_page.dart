import 'dart:typed_data';

import 'package:crop_box/crop_box.dart';
import 'package:elegant_flutter/picker/image%20picker/head%20portrait/crop_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/services.dart';
import 'dart:ui';

/// 头像选择
class HeadPortraitPickerPage extends StatefulWidget {
  HeadPortraitPickerPage({Key? key}) : super(key: key);

  @override
  _HeadPortraitPickerPageState createState() => _HeadPortraitPickerPageState();
}

class _HeadPortraitPickerPageState extends State<HeadPortraitPickerPage> {
  Widget showImg = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('头像选择'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),

            /// NetWork Image
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CropIndex(
                              width: 200,
                              height: 315,
                              imageUrl:
                                  "https://img1.maka.im/materialStore/beijingshejia/tupianbeijinga/9/M_7TNT6NIM/M_7TNT6NIM_v1.jpg",
                              clipType: ClipType.networkImage,
                            )));
              },
              child: Text('网络图片选择'),
            ),

            /// Local Image
            TextButton(
              onPressed: () async {
                PickedFile? pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  Uint8List bytes = await pickedFile.readAsBytes();
                  Size imageSize = await ImageCrop.getImageSize(bytes);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CropIndex(
                  //               width: imageSize.width,
                  //               height: imageSize.height,
                  //               localImageData: bytes,
                  //               clipType: ClipType.localImage,
                  //             )));
                  _navigateAndDisplaySelection(context, imageSize, bytes);
                }
              },
              child: Text('本地相册选择'),
            ),
            showImg,
          ],
        ),
      ),
    );
  }

  _navigateAndDisplaySelection(
      BuildContext context, Size imageSize, Uint8List bytes) async {
    final imageBytes = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CropIndex(
                width: imageSize.width,
                height: imageSize.height,
                localImageData: bytes,
                clipType: ClipType.localImage,
              )),
    );
    setState(() {
      // ignore: unnecessary_statements
      imageBytes;
    });
    showImg = Container(
      width: 100,
      child: Image.memory(
        imageBytes,
        fit: BoxFit.contain,
      ),
    );
  }
}
