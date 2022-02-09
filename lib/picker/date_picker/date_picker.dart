import 'package:elegant_flutter/picker/file_picker/file_picker.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:flutter/material.dart';

/// 日期选择
class DatePickerPage extends StatelessWidget {
  DatePickerPage({
    Key? key,
  }) : super(key: key);
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('时间选择')),
        body: Container(
          child: TextButton(
              onPressed: () {},
              child: Text(
                '时间选择',
                style: TextStyle(color: Colors.blue),
              )),
        ));
  }
}
