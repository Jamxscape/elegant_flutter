import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationWithoutNetworkPage extends StatefulWidget {
  const LocationWithoutNetworkPage({Key? key}) : super(key: key);

  @override
  _LocationWithoutNetworkPageState createState() =>
      _LocationWithoutNetworkPageState();
}

class _LocationWithoutNetworkPageState
    extends State<LocationWithoutNetworkPage> {
  Position? position;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      print("定位权限申请通过");
      position = await Geolocator.getLastKnownPosition();
    } else {
      print("定位权限申请不通过");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text('经度：${position == null ? '获取中' : position!.longitude}'),
          Text('纬度：${position == null ? '获取中' : position!.latitude}'),
        ],
      ),
    );
  }

  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
