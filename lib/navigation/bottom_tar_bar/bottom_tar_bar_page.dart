import 'dart:async';

import 'package:flutter/material.dart';

class BottomTarBarPage extends StatefulWidget {
  const BottomTarBarPage({Key? key}) : super(key: key);

  @override
  State<BottomTarBarPage> createState() => _BottomTarBarPageState();
}

class _BottomTarBarPageState extends State<BottomTarBarPage> {
  late PageController _controller;
  late ValueNotifier<int> _index;

  @override
  void initState() {
    super.initState();
    _index = ValueNotifier(0);
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          _index.value = index;
        },
        children: [
          Text('页面1'),
          Text('页面2'),
          Text('页面3'),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _index,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          items: bottomItems,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF0D7BFC),
          unselectedItemColor: Color(0xFF999999),
          backgroundColor: Colors.white,
          onTap: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: SizedBox(height: 32, width: 32, child: Text('🏠')),
      activeIcon: SizedBox(
          height: 24,
          width: 24,
          child: Text('🏠', style: TextStyle(color: Colors.blue))),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: SizedBox(height: 32, width: 32, child: Text('🏠')),
      activeIcon: SizedBox(
          height: 24,
          width: 24,
          child: Text('🏠', style: TextStyle(color: Colors.blue))),
      label: '首页2',
    ),
    BottomNavigationBarItem(
      icon: SizedBox(height: 32, width: 32, child: Text('🏠')),
      activeIcon: SizedBox(
          height: 24,
          width: 24,
          child: Text('🏠', style: TextStyle(color: Colors.blue))),
      label: '首页3',
    ),
  ];
}
