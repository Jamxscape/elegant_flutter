import 'package:flutter/material.dart';

class ButtonStylePage extends StatelessWidget {
  const ButtonStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用按钮样式"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              obliqueButton(),
              diamondButton(),
              rectangleButton(),
              trapezoidButton(),
              underlineButton(),
              stadiumButton(),
              stadiumRectangleButton(),
              knifeButton(),
              roundButton(),
              ovalShapedButton(),
              continuousButton(),
              circleButton(),
              stadiumBgButton(),
              roundedBgButton(),
              circleBgButton(),
              rectangleBgButton(),
              roundedBgIconButton(),
              roundedBgIconRightButton(),
              outlinedIconButton(),
              gradientButton(),
              disableButton(),
              dropDownButton(),
              popupMenuButton(),
              iconButton(),
              buttonBar(),
            ],
          )),
    );
  }

  /// 斜角棱形
  Widget obliqueButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: BeveledRectangleBorder(
            side: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('斜角棱形按钮'),
      onPressed: () {},
    );
  }

  /// 菱形按钮
  Widget diamondButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: BeveledRectangleBorder(
            side: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(300)),
      ),
      child: Text('菱形按钮'),
      onPressed: () {},
    );
  }

  /// 矩形按钮
  Widget rectangleButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: BeveledRectangleBorder(
            side: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(0)),
      ),
      child: Text('矩形按钮'),
      onPressed: () {},
    );
  }

  /// 梯形按钮
  Widget trapezoidButton() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: BeveledRectangleBorder(
          side: BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
      ),
      child: Text('梯形按钮'),
      onPressed: () {},
    );
  }

  /// 下划线按钮
  /// 没使用[TextButton]
  Widget underlineButton() {
    return InkWell(
      onTap: () => print('hello'),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.red, width: 2),
              left: BorderSide(color: Colors.blue, width: 1)),
        ),
        child: Center(
          child: Text(
            '下划线按钮',
          ),
        ),
      ),
    );
  }

  /// 足球场型按钮
  Widget stadiumButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('足球场边框按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.red),
        shape: StadiumBorder(),
      ),
    );
  }

  /// 刀型按钮
  Widget knifeButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('刀型按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
      ),
    );
  }

  /// 半足球场半矩形型按钮
  Widget stadiumRectangleButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('半足球场半矩形型按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
      ),
    );
  }

  /// 圆角按钮
  Widget roundButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('圆角按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// 椭圆按钮
  Widget ovalShapedButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('椭圆按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.0, color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(400, 50)),
        ),
      ),
    );
  }

  /// 连续圆角按钮
  Widget continuousButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('连续圆角按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.red),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  /// 圆形按钮
  Widget circleButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text('圆形按钮'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.red),
        shape: CircleBorder(),
        padding: EdgeInsets.all(30),
      ),
    );
  }

  /// 带背景的足球场按钮
  Widget stadiumBgButton() {
    return ElevatedButton(
      child: Text("足球场带背景按钮"),
      onPressed: () => print("it's pressed"),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  /// 带背景的圆角按钮
  Widget roundedBgButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('带背景的圆角按钮'),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    );
  }

  /// 带背景的圆形按钮
  Widget circleBgButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('圆形按钮'),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
        shape: CircleBorder(),
        padding: EdgeInsets.all(24),
      ),
    );
  }

  /// 带背景的棱角按钮
  Widget rectangleBgButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('带背景的棱角按钮'),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.white,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 带简单图标的按钮
  Widget roundedBgIconButton() {
    return ElevatedButton.icon(
      icon: Icon(Icons.thumb_up),
      label: Text("带图标按钮"),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  /// 图标在右的情况
  Widget roundedBgIconRightButton() {
    return ElevatedButton.icon(
      icon: Text('右图标按钮'),
      label: Icon(Icons.arrow_forward, size: 16),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onPressed: () => {},
    );
  }

  /// 带简单图标的外边框的按钮
  Widget outlinedIconButton() {
    return OutlinedButton.icon(
      icon: Icon(Icons.star_outline),
      label: Text("带简单图标的外边框的按钮"),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  /// 渐变色按钮
  Widget gradientButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
        onPrimary: null,
        padding: EdgeInsets.all(0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(32.0),
        // ),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
          alignment: Alignment.center,
          child: const Text(
            '渐变色按钮',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  /// 不可点击按钮
  Widget disableButton() {
    return TextButton(
      child: Text('不可点击'),
      onPressed: null,
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// 下拉选择
  Widget dropDownButton() {
    var _dropValue = '语文';
    return DropdownButton(
      hint: Text('请选择'),
      value: _dropValue,
      items: [
        DropdownMenuItem(
          child: Text('语文'),
          value: '语文',
        ),
        DropdownMenuItem(child: Text('数学'), value: '数学'),
        DropdownMenuItem(child: Text('英语'), value: '英语'),
      ],
      onChanged: (value) {},
    );
  }

  /// 菜单选中控件
  Widget popupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: '语文',
            child: Text('语文'),
          ),
          PopupMenuItem<String>(
            value: '数学',
            child: Text('数学'),
          ),
          PopupMenuItem<String>(
            value: '英语',
            child: Text('英语'),
          ),
          PopupMenuItem<String>(
            value: '生物',
            child: Text('生物'),
          ),
          PopupMenuItem<String>(
            value: '化学',
            child: Text('化学'),
          ),
        ];
      },
    );
  }

  /// 单纯的图标按钮
  Widget iconButton() {
    return IconButton(
      tooltip: '图标按钮',
      icon: Icon(Icons.person),
      iconSize: 30,
      color: Colors.red,
      onPressed: () {},
    );
  }

  /// 多个按钮排列
  Widget buttonBar() {
    ButtonStyle style = OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
    return ButtonBar(
      children: <Widget>[
        TextButton(
          onPressed: null,
          child: Text('1'),
          style: style,
        ),
        TextButton(
          onPressed: null,
          child: Text('2'),
          style: style,
        ),
        TextButton(
          onPressed: null,
          child: Text('3'),
          style: style,
        ),
        TextButton(
          onPressed: null,
          child: Text('4'),
          style: style,
        ),
      ],
    );
  }
}
