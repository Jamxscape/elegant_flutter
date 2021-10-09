import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter/material.dart';

/// 弹窗
/// https://github.com/YYFlutter/flutter-custom-dialog/blob/master/README_CN.md
class CustomDialogPage extends StatelessWidget {
  CustomDialogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗"),
      ),
      body: Container(
        child: ListView(children: [
          TextButton(
            onPressed: () {
              yyAlertDialogWithScaleIn();
            },
            child: Text('Widget自定义框架'),
          ),
          TextButton(
            onPressed: () {
              yyTipFinished(context: context);
            },
            child: Text('提示完成按钮'),
          ),
          TextButton(
            onPressed: () {
              bottomSheet();
            },
            child: Text('底部弹出按钮'),
          ),
          TextButton(
            onPressed: () {
              topSheet();
            },
            child: Text('顶部弹出按钮'),
          ),
        ]),
      ),
    );
  }
}

YYDialog yyAlertDialogWithScaleIn() {
  return YYDialog().build()
    ..width = 375
    ..height = 575
    ..borderRadius = 6.0
    ..duration = Duration(milliseconds: 100)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..widget(Container(
      alignment: Alignment.center,
      child: Text('你好'),
    ))
    ..show();
}

YYDialog yyTipFinished({required BuildContext context}) {
  return YYDialog().build()
    ..width = 270
    ..height = 136
    ..borderRadius = 6.0
    ..duration = Duration(milliseconds: 100)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..text(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 22),
        text: '主标题',
        color: Colors.black,
        fontSize: 18.0)
    ..text(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, bottom: 17),
        text: '副标题',
        color: Colors.black26,
        fontSize: 16.0)
    ..divider()
    ..widget(
      Container(
        padding: EdgeInsets.only(top: 0),
        child: TextButton(
          child: Text(
            "确定",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            onSurface: Colors.grey,
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
    )
    ..show();
}

YYDialog bottomSheet() {
  return YYDialog().build()
    ..width = 375.0
    ..height = 166.0
    ..gravity = Gravity.bottom
    ..gravityAnimationEnable = true
    ..borderRadius = 4.0
    ..text(
      padding: EdgeInsets.all(18.0),
      text: "底部弹出栏",
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    )
    ..show();
}

YYDialog topSheet() {
  final TextEditingController test1 = TextEditingController();
  final TextEditingController test2 = TextEditingController();
  final TextEditingController test3 = TextEditingController();
  return YYDialog().build()
    ..width = 375.0
    ..height = 300.0
    ..gravity = Gravity.top
    ..gravityAnimationEnable = true
    ..borderRadius = 4.0
    ..widget(Scaffold(
      appBar: AppBar(title: Text("hi")),
      body: Container(
          child: ListView(
        children: [
          Text("hhhhh"),
        ],
      )),
    )) // 有错误
    ..show();
}
