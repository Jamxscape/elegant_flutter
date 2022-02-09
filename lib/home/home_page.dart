import 'package:elegant_flutter/camera/camera_page.dart';
import 'package:elegant_flutter/dialog/dialog_page.dart';
import 'package:elegant_flutter/hardware/hardware_page.dart';
import 'package:elegant_flutter/image/image_page.dart';
import 'package:elegant_flutter/lists/list_page.dart';
import 'package:elegant_flutter/location/location_page.dart';
import 'package:elegant_flutter/navigation/navigation_page.dart';
import 'package:elegant_flutter/network/network_page.dart';
import 'package:elegant_flutter/picker/picker_page.dart';
import 'package:elegant_flutter/sqlite/sqlite_page.dart';
import 'package:elegant_flutter/widget/list_title_widget.dart';
import 'package:elegant_flutter/widget/widget_page.dart';
import 'package:elegant_flutter/wifi/wifi_page.dart';
import 'package:flutter/material.dart';

/// 主页面
class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTitleWidget(title: '导航栏', pageName: NavigationPage()),
          ListTitleWidget(title: '选择框', pageName: PickerPage()),
          ListTitleWidget(title: '网络', pageName: NetworkPage()),
          ListTitleWidget(title: '硬件', pageName: HardwarePage()),
          ListTitleWidget(title: '弹窗', pageName: DialogPage()),
          ListTitleWidget(title: '常用组件', pageName: WidgetPage()),
          ListTitleWidget(title: '图像', pageName: ImagePage()),
          ListTitleWidget(title: 'SQL', pageName: SQLitePage()),
          ListTitleWidget(title: '列表', pageName: ListPage()),
        ],
      )),
    );
  }
}
