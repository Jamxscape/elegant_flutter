import 'package:flutter/material.dart';

Tab tabBarItem(String title, {bool showRightImage = true}) {
  return Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(title),
          ),
        ),

        ///分割符自定义，可以放任何widget
        showRightImage
            ? Container(
                width: 2,
                height: 30,
                child: Image.asset('assets/separator.png'),
              )
            : Container(
                width: 1,
              )
      ],
    ),
  );
}

class TabBarPage extends StatefulWidget {
  final List<String> title;
  final List<Widget> widgetList;
  TabBarPage({Key? key, required this.title, required this.widgetList})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TabBarPageState();
  }
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController mController; // tab控制器

  final List<Tab> titleTabs = <Tab>[];

  @override
  void initState() {
    super.initState();

    mController = TabController(
        initialIndex: 0, length: widget.title.length, vsync: this);
    // 初始化TabController
    // 参数1：初试显示的tab位置
    // 参数2：tab的个数
    // 参数3：动画效果的异步处理，默认格式

    // 添加监听器
    mController.addListener(() => _onTabChanged());
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.title.length; i++) {
      if (i == widget.title.length - 1) {
        titleTabs.add(
          tabBarItem(widget.title[i], showRightImage: false),
        );
      } else {
        titleTabs.add(
          tabBarItem("安卓"),
        );
      }
    }
    return Column(
      children: [
        TabBar(
          labelPadding: EdgeInsets.all(0),
          tabs: titleTabs,
          controller: mController,
          isScrollable: false,
          labelColor: Colors.black,
          indicatorColor: Color(0xFF0D7BFC),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,

          /// 简单暴力的解决办法，左右间距根据上边间隔符的大小决定
          indicatorPadding: EdgeInsets.only(left: 0, bottom: 0.5, right: 0),
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Expanded(
          child: TabBarView(
            controller: mController,
            children: widget.widgetList,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose(); // 当整个页面dispose时，记得把控制器也dispose掉，释放内存
  }

  // 点击监听函数
  _onTabChanged() {
    print(mController.index);
  }
}

class TabBarPageTestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("顶部导航栏"),
      ),
      body: TabBarPage(
        title: ["安卓", "苹果"],
        widgetList: [Text("安卓"), Text("苹果")],
      ),
    );
  }
}
