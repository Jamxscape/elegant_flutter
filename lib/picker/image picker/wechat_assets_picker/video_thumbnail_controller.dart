import 'dart:developer';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailController extends GetxController {
  final RxString path = ''.obs;
  final RxString tempDirPath = ''.obs;
  final RxString thumbnailPath = ''.obs;
  @override
  Future<void> initData() async {}

  Future<void> videoThumbnail(String videoName) async {
    await getDatabasesPath().then((result) {
      path.value = result;
    });
    tempDirPath.value = (await getTemporaryDirectory()).path;
    log(tempDirPath.value);
    thumbnailPath.value = (await VideoThumbnail.thumbnailFile(
      video: '$path/$videoName',
      thumbnailPath: tempDirPath.value,
      imageFormat: ImageFormat.PNG,
      maxWidth: 150,
      maxHeight: 150,
      quality: 100,
    ))!;
  }
}
