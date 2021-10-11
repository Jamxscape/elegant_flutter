import 'package:elegant_flutter/navigation/tab_bar/tab_bar_page.dart';
import 'package:flutter/material.dart';

/// 各种各样的导航栏
class NavigationPage extends StatelessWidget {
  NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航栏"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('顶部导航栏'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return TabBarPageTestView();
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
