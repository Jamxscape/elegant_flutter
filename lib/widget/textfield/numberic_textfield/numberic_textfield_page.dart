import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 特殊类型的输入框
// ignore: must_be_immutable
class NumbericTextFieldPage extends StatelessWidget {
  NumbericTextFieldPage({Key? key}) : super(key: key);
  TextEditingController numController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('不同类型的输入框'),
      ),
      body: Container(
          child: ListView(
        children: [
          Text('只能输入数字的输入框'),
          TextField(
            controller: numController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: '只能输入数字的输入框',
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                ),
              ),
            ),
          ),
          Text('电话号码'),
          TextField(
            controller: phoneController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            maxLength: 11,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: '只能输入电话号的输入框',
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                ),
              ),
            ),
          ),
          Text('邮箱号'),
          TextField(
            controller: emailAddressController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: '只能输入邮箱的输入框',
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                ),
              ),
            ),
          ),
          Text('网址'),
          TextField(
            controller: urlController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: '只能输入网址的输入框',
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                ),
              ),
            ),
          ),
          Text('时间'),
          TextField(
            controller: datetimeController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: '只能输入时间的输入框',
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                ),
              ),
            ),
          ),
          Text('密码'),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\u4e00-\u9fa5]'))
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              hintText: '只能输入密码的输入框',
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.8,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
