import 'package:flutter/material.dart';

class SystemDialogPage extends StatelessWidget {
  SystemDialogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗"),
      ),
      body: Container(
        child: ListView(children: [
          TextButton(
            onPressed: () {},
            child: Text('下部弹出框'),
          ),
        ]),
      ),
    );
  }
}
