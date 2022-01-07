import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BluetoothDataSendPage extends StatefulWidget {
  const BluetoothDataSendPage({
    Key? key,
    required this.characteristic,
  }) : super(key: key);
  final QualifiedCharacteristic characteristic;

  @override
  _BluetoothDataSendPageState createState() => _BluetoothDataSendPageState();
}

class _BluetoothDataSendPageState extends State<BluetoothDataSendPage> {
  final ble = FlutterReactiveBle();
  late Future<String> Function(QualifiedCharacteristic characteristic)
      _readCharacteristic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数据发送和接收')),
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  writeDataWithResponse();
                },
                child: Text('发送数据')),
            TextButton(onPressed: () {}, child: Text('接收数据')),
          ],
        ),
      ),
    );
  }

  Future<void> writeDataWithResponse() async {
    try {
      log('Write with response value :  to ${widget.characteristic.characteristicId}');
      List<int> list = utf8.encode('你好');
      log('$list');
      await ble
          .writeCharacteristicWithResponse(widget.characteristic, value: [124]);
    } on Exception catch (e, s) {
      log(
        'Error occured when writing ${widget.characteristic.characteristicId} : $e',
      );
      print(s);
      rethrow;
    }
  }

  Future<void> readCharacteristic() async {
    try {
      final result = await _readCharacteristic(widget.characteristic);

      log('Read ${widget.characteristic.characteristicId}: value = $result');
    } on Exception catch (e, s) {
      log(
        'Error occured when reading ${widget.characteristic.characteristicId} : $e',
      );
      print(s);
      rethrow;
    }
  }
}
