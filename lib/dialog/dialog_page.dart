import 'package:elegant_flutter/dialog/custom_dialog/custom_dialog_page.dart';
import 'package:flutter/material.dart';

/// 各种硬件使用的例子
class DialogPage extends StatelessWidget {
  DialogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗使用案例"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('弹窗'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return CustomDialogPage();
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
