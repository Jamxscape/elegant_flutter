import 'package:elegant_flutter/image/SVG/svg_page.dart';
import 'package:elegant_flutter/network/ping/ping_page.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:flutter/material.dart';

/// 图片处理
class ImagePage extends StatelessWidget {
  ImagePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片处理"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('SVG'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return SVGPage();
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
