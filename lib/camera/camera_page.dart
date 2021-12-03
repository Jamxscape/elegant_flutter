import 'package:elegant_flutter/camera/QR_code/custom_qr_code_page.dart';
import 'package:elegant_flutter/camera/QR_code/qr_code_page.dart';
import 'package:elegant_flutter/picker/image%20picker/wechat_assets_picker/wechat_take_photo_page.dart';
import 'package:flutter/material.dart';

/// 相机有关的
class CameraPage extends StatelessWidget {
  CameraPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("相机"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('二维码扫描'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return QRCodePage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('自定义二维码扫描'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return CustomQRCodePAge();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('微信类型的拍照录像'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return WechatTakePhotoPage();
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
