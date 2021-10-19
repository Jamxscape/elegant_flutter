import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zefyr/zefyr.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late ZefyrController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWelcomeEditor(context),
    );
  }

  Widget _buildWelcomeEditor(BuildContext context) {
    return Column(
      children: [
        ZefyrToolbar.basic(controller: _controller),
        Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: ZefyrEditor(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              // readOnly: true,
              // padding: EdgeInsets.only(left: 16, right: 16),
              onLaunchUrl: _launchUrl,
            ),
          ),
        ),
      ],
    );
  }

  void _launchUrl(String url) async {
    final result = await canLaunch(url);
    if (result) {
      await launch(url);
    }
  }
}
