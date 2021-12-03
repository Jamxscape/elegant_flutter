import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_plugin_qrcode/flutter_plugin_qrcode.dart';

import 'package:elegant_flutter/camera/QR_code/custom_qr_preview_page.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String _qrcode = '二维码扫描';

  @override
  void initState() {
    super.initState();
  }

  Future<void> getQrcodeState() async {
    String qrcode;
    try {
      qrcode = await FlutterPluginQrcode.getQRCode;
    } on PlatformException {
      qrcode = '获取条形码失败';
    }

    if (!mounted) return;
    // setState(() {
    //   _qrcode = qrcode;
    // });
    /// 返回最后的结果
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CustomQRPreviewPage(
        result: qrcode,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('条形码'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                getQrcodeState();
              },
              child: Text('$_qrcode')),
        ),
      ),
    );
  }
}
