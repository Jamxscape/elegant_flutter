import 'package:elegant_flutter/network/ping/ping_page.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:elegant_flutter/sqlite/sqflite/dog.dart';
import 'package:elegant_flutter/sqlite/sqflite/sqflite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

///
class SqflitePage extends StatelessWidget {
  SqflitePage({
    Key? key,
  }) : super(key: key);
  SqfliteController controller = SqfliteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQL"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              var fido = Dog(
                id: 0,
                name: 'Fido',
                age: 35,
              );
              controller.insertDB(fido);

              /// 查询
              controller.dogs();
            },
            child: Text('生成数据库'),
          ),
          TextButton(
            onPressed: () {
              var fido = Dog(
                id: 0,
                name: '旺柴',
                age: 30,
              );
              controller.updateDog(fido);

              /// 查询
              controller.dogs();
            },
            child: Text('修改成旺柴 30'),
          ),
          TextButton(
            onPressed: () {
              controller.deleteDog(0);

              /// 查询
              controller.dogs();
            },
            child: Text('删除'),
          ),
          Obx(() {
            return Row(
              children: [
                Text('${controller.fidoRx.value.name}'),
                Text('${controller.fidoRx.value.age}'),
              ],
            );
          }),
        ],
      ),
    );
  }
}
