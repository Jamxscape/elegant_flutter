import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  ListTitleWidget({Key? key, required this.pageName, required this.title})
      : super(key: key);
  final pageName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          title: Text(title),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return pageName;
            }),
          ),
        ),
        Divider(
          height: 0.0,
          indent: 0.0,
          color: Colors.black26,
        ),
      ],
    ));
  }
}
