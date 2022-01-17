import 'package:flutter/material.dart';

class CommonTextfieldStyle extends StatelessWidget {
  CommonTextfieldStyle({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("输入框样式"),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              children: [
                Container(
                  color: Colors.blue,
                  child: SizedBox(
                    width: 250,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xD9FFFFFF),
                          hintText: '切割背景',
                          hintStyle: TextStyle(
                            color: Color(0x59000000),
                            fontSize: 16,
                          ), //修改颜色
                          contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xD9FFFFFF),
                    hintText: '正常的边框',
                    hintStyle: TextStyle(
                      color: Color(0x59000000),
                      fontSize: 16,
                    ), //修改颜色
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0)),
                    contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xD9FFFFFF),
                    hintText: '足球场式边框',
                    hintStyle: TextStyle(
                      color: Color(0x59000000),
                      fontSize: 16,
                    ), //修改颜色
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xD9FFFFFF),
                    hintText: '圆角矩形',
                    hintStyle: TextStyle(
                      color: Color(0x59000000),
                      fontSize: 16,
                    ), //修改颜色
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xD9FFFFFF),
                    hintText: '半圆角矩形半矩形',
                    hintStyle: TextStyle(
                      color: Color(0x59000000),
                      fontSize: 16,
                    ), //修改颜色
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xD9FFFFFF),
                    hintText: '无边框输入框',
                    hintStyle: TextStyle(
                      color: Color(0x59000000),
                      fontSize: 16,
                    ), //修改颜色
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xD9FFFFFF),
                    hintText: '无棱角矩形输入框',
                    hintStyle: TextStyle(
                      color: Color(0x59000000),
                      fontSize: 16,
                    ), //修改颜色
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(0.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                    hintText: '只带下划线',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    hintText: '邮箱',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '账户名称',
                  ),
                  onChanged: (text) {},
                ),
                SizedBox(height: 10),
                Text('微信聊天框类型的输入框'),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(right: 100),
                  height: 30,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xD9FFFFFF),
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Color(0x59000000),
                        fontSize: 16,
                      ), //修改颜色
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10), // 输入框的上下宽度
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 36,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: false,
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Color(0xFFBFBFBF)),
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                      suffixIcon: Offstage(
                        // offstage: !controller.clearVisible.value,
                        child: InkWell(
                          onTap: () {
                            controller.clear();
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: Color(0x17000000),
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(11.0),
                      hintText: '搜索',
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Color(0xFFBFBFBF)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
