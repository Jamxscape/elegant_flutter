import 'package:elegant_flutter/location/location_without_network_page.dart';
import 'package:elegant_flutter/textfield/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

/// 定位
class LocationPage extends StatelessWidget {
  LocationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("定位"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('获取当前的定位样式（在没有网路的情况下）'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return LocationWithoutNetworkPage();
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
