import 'package:elegant_flutter/camera/QR_code/custom_qr_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:ai_barcode/ai_barcode.dart';

class CustomQRCodePAge extends StatefulWidget {
  const CustomQRCodePAge({Key? key}) : super(key: key);

  @override
  _CustomQRCodePAgeState createState() => _CustomQRCodePAgeState();
}

class _CustomQRCodePAgeState extends State<CustomQRCodePAge> {
  late ScannerController _scannerController;

  @override
  void initState() {
    super.initState();

    _scannerController = ScannerController(scannerResult: (result) {
      /// 返回最后的结果
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return CustomQRPreviewPage(
          result: result,
        );
      }));
    }, scannerViewCreated: () {
      TargetPlatform platform = Theme.of(context).platform;
      if (TargetPlatform.iOS == platform) {
        Future.delayed(Duration(seconds: 2), () {
          _scannerController.startCamera();
          _scannerController.startCameraPreview();
        });
      } else {
        _scannerController.startCamera();
        _scannerController.startCameraPreview();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scannerController.stopCameraPreview();
    _scannerController.stopCamera();
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
        child: PlatformAiBarcodeScannerWidget(
          platformScannerController: _scannerController,
        ),
      ),
    );
  }
}
