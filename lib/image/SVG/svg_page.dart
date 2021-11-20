import 'package:elegant_flutter/network/ping/ping_page.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// SVG处理
/// 读取出SVG图标
class SVGPage extends StatelessWidget {
  SVGPage({
    Key? key,
  }) : super(key: key);

  final String assetName = 'assets/image.svg';

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');
    return Scaffold(
      appBar: AppBar(
        title: Text("图片处理"),
      ),
      body: Container(
        child: svg,
      ),
    );
  }
}
