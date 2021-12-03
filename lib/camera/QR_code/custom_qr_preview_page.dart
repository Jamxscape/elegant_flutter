import 'package:flutter/material.dart';

class CustomQRPreviewPage extends StatelessWidget {
  const CustomQRPreviewPage({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扫描结果'),
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}
