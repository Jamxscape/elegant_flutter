import 'dart:async';
import 'dart:developer';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';

class BluetoothDataController extends GetxController {
  final flutterReactiveBle = FlutterReactiveBle();
  final RxList<DiscoveredDevice> devices = <DiscoveredDevice>[].obs;
  final RxList<ConnectionStateUpdate> deviceConnectionController =
      <ConnectionStateUpdate>[].obs;
  final RxList<DiscoveredService> discoverServicesList =
      <DiscoveredService>[].obs;
  void scanDevice(List<Uuid> serviceIds) {
    flutterReactiveBle
        .scanForDevices(withServices: serviceIds, scanMode: ScanMode.lowLatency)
        .listen((device) {
      final knownDeviceIndex = devices.indexWhere((d) => d.id == device.id);
      if (knownDeviceIndex >= 0) {
        devices[knownDeviceIndex] = device;
        deviceConnectionController[knownDeviceIndex] = ConnectionStateUpdate(
            connectionState: DeviceConnectionState.disconnected,
            deviceId: '',
            failure: null);
      } else {
        devices.add(device);
        deviceConnectionController.add(ConnectionStateUpdate(
            connectionState: DeviceConnectionState.disconnected,
            deviceId: '',
            failure: null));
      }
    }, onError: (Object e) {
      log('$e');
    });
  }

  Future<void> connect(String deviceId, int index) async {
    FlutterReactiveBle ble = FlutterReactiveBle();

    // ignore: close_sinks
    ble
        .connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 2),
    )
        .listen(
      (update) async {
        deviceConnectionController[index] = update;
        discoverServicesList.value = await discoverServices(deviceId);
        log('数字${discoverServicesList.length}');
      },
      onError: (Object e) =>
          log('Connecting to device $deviceId resulted in error $e'),
    );
  }

  final ble = FlutterReactiveBle();

  /// 获取服务列表
  Future<List<DiscoveredService>> discoverServices(String deviceId) async {
    final Future<List<DiscoveredService>> Function(String deviceId)
        bleDiscoverServices = ble.discoverServices;
    try {
      log('Start discovering services for: $deviceId');
      final result = await bleDiscoverServices(deviceId);
      log('Discovering services finished');
      return result;
    } on Exception catch (e) {
      log('Error occured when discovering services: $e');
      rethrow;
    }
  }

  void stopDevice() {}
  Future<void> initData() async {}
}
