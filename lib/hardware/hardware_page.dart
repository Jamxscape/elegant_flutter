import 'package:elegant_flutter/camera/camera_page.dart';
import 'package:elegant_flutter/hardware/bluetooth/bluetooth_data_page.dart';
import 'package:elegant_flutter/hardware/compass/compass.dart';
import 'package:elegant_flutter/hardware/device_info/device_info_page.dart';
import 'package:elegant_flutter/location/location_page.dart';
import 'package:elegant_flutter/widget/list_title_widget.dart';
import 'package:elegant_flutter/wifi/wifi_page.dart';
import 'package:flutter/material.dart';

/// 各种硬件使用的例子
class HardwarePage extends StatelessWidget {
  HardwarePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("硬件使用案例"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTitleWidget(title: '指南针/罗盘', pageName: CompassPage()),
          ListTitleWidget(title: '蓝牙', pageName: BluetoothDataPage()),
          ListTitleWidget(title: '本机信息', pageName: DeviceInfoPage()),
          ListTitleWidget(title: '相机', pageName: CameraPage()),
          ListTitleWidget(title: '定位', pageName: LocationPage()),
          ListTitleWidget(title: 'WiFi', pageName: WiFiPage()),
        ],
      )),
    );
  }
}
