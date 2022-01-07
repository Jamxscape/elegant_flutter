import 'dart:developer';

import 'package:elegant_flutter/hardware/bluetooth/bluetooth_data_controller.dart';
import 'package:elegant_flutter/hardware/bluetooth/bluetooth_data_send_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BluetoothDataPage extends StatefulWidget {
  const BluetoothDataPage({Key? key}) : super(key: key);

  @override
  _BluetoothDataPageState createState() => _BluetoothDataPageState();
}

class _BluetoothDataPageState extends State<BluetoothDataPage> {
  BluetoothDataController controller = BluetoothDataController();
  late List<DiscoveredService> discoveredServices;
  @override
  void initState() {
    super.initState();
    controller.scanDevice([]);
    log(controller.devices.string);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getDiscoveredService() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('蓝牙数据传输'),
        ),
        body: Obx(() {
          return ListView.builder(
              itemCount: controller.devices.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(children: [
                    Text(
                      controller.devices[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.connect(
                              controller.devices[index].id, index);
                        },
                        child: Text(controller.deviceConnectionController[index]
                                    .connectionState ==
                                DeviceConnectionState.connected
                            ? '已连接'
                            : '连接')),
                    TextButton(
                        onPressed: () {
                          DiscoveredCharacteristic? service;
                          inspect(controller.discoverServicesList.length);
                          controller.discoverServicesList
                              .asMap()
                              .forEach((i, ser) {
                            for (int j = 0;
                                j < ser.characteristics.length;
                                j++) {
                              if (ser.characteristics[j].isReadable &&
                                  ser.characteristics[j]
                                      .isWritableWithResponse) {
                                service = ser.characteristics[j];
                              }
                            }
                          });
                          if (service != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) {
                                return BluetoothDataSendPage(
                                  characteristic: QualifiedCharacteristic(
                                    characteristicId: service!.characteristicId,
                                    serviceId: service!.serviceId,
                                    deviceId: controller.devices[index].id,
                                  ),
                                );
                              }),
                            );
                          }
                        },
                        child: Text('跳转'))
                  ]),
                );
              });
        }));
  }
}
