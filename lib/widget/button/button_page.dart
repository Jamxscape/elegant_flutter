import 'package:flutter/material.dart';

import 'button_style/button_style_page.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('按钮样式'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return ButtonStylePage();
              }),
            ),
          ),
        ],
      )),
    );
  }
}
