import 'dart:io';

import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/video_thumbnail_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoThumbnailPage extends StatelessWidget {
  VideoThumbnailPage({Key? key}) : super(key: key);
  VideoThumbnailController controller = VideoThumbnailController();

  @override
  Widget build(BuildContext context) {
    controller.videoThumbnail('REC6184064213864971449.mp4');
    return Obx(() {
      return controller.thumbnailPath.value != ''
          ? ExtendedImage.file(
              File(controller.thumbnailPath.value),
              width: 200,
              height: 200,
            )
          : Container(
              child: Text('暂无图片'),
            );
    });
  }
}
