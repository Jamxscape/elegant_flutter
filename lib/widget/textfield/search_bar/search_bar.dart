import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_bar_controller.dart';

class CandidateWords {
  String word;
  CandidateWords(this.word);
}

/// 各种各样的导航栏
class SearchBar extends StatefulWidget {
  /// 候选词
  final List<CandidateWords> words;

  /// 输入的提示文字
  final String hintText;
  SearchBar({Key? key, required this.words, required this.hintText})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController editingController = TextEditingController();
  TextEditingController editingController2 = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");

  FocusNode _focusNode = FocusNode();
  SearchBarController controller = SearchBarController();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        controller.isFocus.value = false;
      } else {
        controller.isFocus.value = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 358,
              height: 46,
              child: TextField(
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController,
                //     textAlign: TextAlign.center,  //字体居中
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 14,
                  ), //修改颜色
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Obx(() {
            print('${controller.isFocus}');
            return SizedBox(
              // height: controller.isFocus.value
              //     ? (editingController.text.isEmpty ? 0 : 120)
              //     : 0,
              height: controller.isFocus.value ? 120 : 0,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.words.length,
                  itemBuilder: (context, index) {
                    if (widget.words[index].word
                            .toLowerCase()
                            .contains(editingController.text) &&
                        editingController.text.isNotEmpty) {
                      return candidateTitle(title: widget.words[index].word);
                    }
                    if (editingController.text.isEmpty) {
                      /// 搜索框的时候为
                      //return Container();

                      /// 选择候选框
                      return candidateTitle(title: widget.words[index].word);
                    } else {
                      return Container();
                    }
                  }),
            );
          }),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 358,
              height: 46,
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController2,
                //     textAlign: TextAlign.center,  //字体居中
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  hintText: '输入',
                  hintStyle: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 14,
                  ), //修改颜色
                  // contentPadding: EdgeInsets.all(14.5), // 输入框的上下宽度
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget candidateTitle({required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 300,
          padding: EdgeInsets.only(left: 20),
          child: TextButton(
            child: SizedBox(
              width: 330,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              onSurface: Colors.grey,
              padding: EdgeInsets.all(0),
            ),
            onPressed: () {
              editingController.text = title;
              _focusNode.unfocus();
            },
          ),
        ),
        Divider(
          height: 10.0,
          indent: 20.0,
          endIndent: 20,
          color: Colors.black26,
        ),
      ],
    );
  }
}

class SearchBarTestView extends StatelessWidget {
  List<CandidateWords> words = [
    CandidateWords("Start"),
    CandidateWords("Go"),
    CandidateWords("Drive"),
    CandidateWords("Sleep"),
    CandidateWords("double"),
    CandidateWords("nice"),
    CandidateWords("hh"),
    CandidateWords("你好"),
    CandidateWords("你的"),
    CandidateWords("你好啊"),
    CandidateWords("你好呀"),
    CandidateWords("你好好"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
      ),
      body: SearchBar(
        words: words,
        hintText: "输入",
      ),
    );
  }
}
