import 'package:elegant_flutter/lists/contacts/contacts_page.dart';
import 'package:elegant_flutter/network/ping/ping_page.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:elegant_flutter/sqlite/sqflite/sqflite_page.dart';
import 'package:flutter/material.dart';

/// 各种各样的列表
class ListPage extends StatelessWidget {
  ListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表"),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: Text('联系人'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) {
                return ContactsPage();
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
