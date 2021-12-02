import 'package:elegant_flutter/network/ping/ping_page.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:elegant_flutter/sqlite/sqflite/sqflite_page.dart';
import 'package:flutter/material.dart';

/// 各种各样的数据库存储模型
class SQLitePage extends StatelessWidget {
  SQLitePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQL"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('sqflite'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return SqflitePage();
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
