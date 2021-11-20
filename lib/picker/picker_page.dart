import 'package:elegant_flutter/picker/date_picker/date_picker.dart';
import 'package:elegant_flutter/picker/file_picker/file_picker.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:elegant_flutter/picker/multiple_picker/multiple_picker.dart';
import 'package:flutter/material.dart';

/// 各种各样的选择框
class PickerPage extends StatelessWidget {
  PickerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择框"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('图片选择框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return ImagePickerPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('文件选择框'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return FilePickerDemo();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('日期选择'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return DatePickerPage();
              }),
            ),
          ),
          Divider(
            height: 0.0,
            indent: 0.0,
            color: Colors.black26,
          ),
          ListTile(
            title: Text('多项选择'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return MultiplePickerPage();
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
