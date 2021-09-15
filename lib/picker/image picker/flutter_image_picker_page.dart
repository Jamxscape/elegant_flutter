import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class FlutterImagePickerPage extends StatefulWidget {
  FlutterImagePickerPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _FlutterImagePickerPageState createState() => _FlutterImagePickerPageState();
}

class _FlutterImagePickerPageState extends State<FlutterImagePickerPage> {
  bool isVideo = false;
  String? _retrieveDataError;
  List<XFile>? _imageFileList;
  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  dynamic _pickImageError;

  final ImagePicker _picker = ImagePicker();
  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _previewImages() {
    // final Text? retrieveError = _getRetrieveErrorWidget();
    // if (retrieveError != null) {
    //   return retrieveError;
    // }
    if (_imageFileList != null) {
      return Container(
          child: kIsWeb
              ? Image.network(_imageFileList![0].path)
              : SizedBox(
                  width: 200,
                  height: 300,
                  child: Image.file(File(_imageFileList![0].path))));
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        '无照片',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
          _imageFileList = response.files;
        });
      }
    } else {
      // _retrieveDataError = response.exception!.code; // 错误处理
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 默认选择"),
      ),
      body: Container(
          child: Column(
        children: [
          /// 按钮模型
          TextButton(
            child: Text(
              "选择单张照片",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                wordSpacing: 0,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF361D0D),
              onSurface: Colors.grey,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              isVideo = false;
              _onImageButtonPressed(ImageSource.gallery, context: context);
            },
          ),
          !kIsWeb && defaultTargetPlatform == TargetPlatform.android
              ? FutureBuilder<void>(
                  future: retrieveLostData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Text(
                          '没有选择照片',
                          textAlign: TextAlign.center,
                        );
                      case ConnectionState.done:
                        return _previewImages();
                      default:
                        if (snapshot.hasError) {
                          return Text(
                            'Pick image/video error: ${snapshot.error}}',
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return const Text(
                            '没有选择照片啊',
                            textAlign: TextAlign.center,
                          );
                        }
                    }
                  },
                )
              : _previewImages(),
        ],
      )),
    );
  }
}
