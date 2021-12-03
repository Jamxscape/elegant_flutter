import 'dart:developer';

import 'package:elegant_flutter/camera/QR_code/custom_qr_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CustomQRCodePAge extends StatefulWidget {
  const CustomQRCodePAge({Key? key}) : super(key: key);

  @override
  _CustomQRCodePAgeState createState() => _CustomQRCodePAgeState();
}

class _CustomQRCodePAgeState extends State<CustomQRCodePAge> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('二维码标题'),
      ),
      body: Container(
          color: Colors.black26,
          width: 375,
          height: 766,
          child: _buildQrView(context)),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 800.0;
    return Stack(
      children: <Widget>[
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 10,
              borderLength: 50,
              borderWidth: 5,
              cutOutSize: scanArea),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        Positioned(
            left: 60,
            top: 520,
            child: Text('将条形码放入框内，即可安全扫描',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )))
      ],
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (result != null) return;
      result = scanData;
      // log(result!.code.toString());
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return CustomQRPreviewPage(
          result: result!.code.toString(),
        );
      }));
    });
  }
}
