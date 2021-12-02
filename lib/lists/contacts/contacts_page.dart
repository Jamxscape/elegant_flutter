import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:elegant_flutter/lists/contacts/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:elegant_flutter/lists/contacts/contact.dart';
import 'package:lpinyin/lpinyin.dart';

/// 各种各样的联系人
class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contactList = [];

  ContactController controller = ContactController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // //加载联系人列表
    // rootBundle.loadString('assets/car_models.json').then((value) {
    //   List list = json.decode(value);
    //   list.forEach((v) {
    //     contactList.add(Contact.fromJson(v));
    //   });
    //   _handleList(contactList);
    // });
    // controller.insertDB(Contact(
    //     id: 0,
    //     userName: '陈到啊',
    //     photo: 'test.png',
    //     phoneNum: '123456789',
    //     cardID: '123456789',
    //     remark: '哈哈哈'));
    contactList = await controller.read();
    _handleList(contactList);
  }

  void _handleList(List<Contact> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].userName!);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contactList);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通讯录"),
      ),
      body: AzListView(
        data: contactList,
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          Contact model = contactList[index];
          return getWeChatListItem(
            context,
            model,
            defHeaderBgColor: Color(0xFFE5E5E5),
          );
        },
        physics: BouncingScrollPhysics(),
        susItemBuilder: (BuildContext context, int index) {
          Contact model = contactList[index];
          if ('↑' == model.getSuspensionTag()) {
            return Container();
          }
          return getSusItem(context, model.getSuspensionTag());
        },
        indexBarData: ['↑', '☆', ...kIndexBarData],
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
          ignoreDragCancel: true,
          downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
          downItemDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          indexHintWidth: 120 / 2,
          indexHintHeight: 100 / 2,
          indexHintDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(getImgPath('ic_index_bar_bubble_gray')),
              fit: BoxFit.contain,
            ),
          ),
          indexHintAlignment: Alignment.centerRight,
          indexHintChildAlignment: Alignment(-0.25, 0.0),
          indexHintOffset: Offset(-20, 0),
        ),
      ),
    );
  }

  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/$name.$format';
  }

  static Widget getWeChatListItem(
    BuildContext context,
    Contact model, {
    double susHeight = 40,
    Color? defHeaderBgColor,
  }) {
    return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
  }

  static Widget getWeChatItem(
    BuildContext context,
    Contact model, {
    Color? defHeaderBgColor,
  }) {
    DecorationImage? image;
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          image: image,
        ),
        child: model.photo == null ? null : Text('头像'),
      ),
      title: Text(model.userName!),
      onTap: () {
        print('点击事件');
        // LogUtil.e("onItemClick : $model");
        // Utils.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }
}
