import 'package:elegant_flutter/picker/record/wechat_voice_widget.dart';
import 'package:flutter/material.dart';

class WechatRecordTestPage extends StatelessWidget {
  const WechatRecordTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: VoiceWidget(
      height: 40.0,
    ));
  }
}
