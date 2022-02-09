import 'dart:io' as file show File;

import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/video_thumbnail_controller.dart';
import 'package:extended_image/extended_image.dart' hide File;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoThumbnailPage extends StatelessWidget {
  VideoThumbnailPage({Key? key}) : super(key: key);
  VideoThumbnailController controller = VideoThumbnailController();

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
    } else {
      controller.videoThumbnail('REC6184064213864971449.mp4');
      if (controller.thumbnailPath.value != '') {}
    }
    return kIsWeb
        ? Container(
            child: Text('不支持网页端'),
          )
        : Obx(() {
            return (controller.thumbnailPath.value != ''
                // ? ExtendedImage.file(
                //     file.File(controller.thumbnailPath.value),
                //     width: 200,
                //     height: 200,
                //   )
                ? Container(child: Text('预览'))
                : Container(
                    child: Text('暂无图片'),
                  ));
          });
  }
}
