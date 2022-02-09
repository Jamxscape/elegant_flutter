import 'package:elegant_flutter/widget/button/button_page.dart';
import 'package:elegant_flutter/widget/chip/chip_page.dart';
import 'package:elegant_flutter/widget/list_title_widget.dart';
import 'package:elegant_flutter/widget/textfield/textfield_page.dart';
import 'package:flutter/material.dart';

/// 常用组件
class WidgetPage extends StatelessWidget {
  WidgetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用组件"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTitleWidget(title: '文本框', pageName: TextFieldPage()),
          ListTitleWidget(title: '按钮', pageName: ButtonPage()),
          ListTitleWidget(title: '标签选择', pageName: ChipPage()),
        ],
      )),
    );
  }
}
