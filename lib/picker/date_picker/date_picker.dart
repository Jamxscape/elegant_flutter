import 'package:elegant_flutter/picker/file_picker/file_picker.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

/// 日期选择
class DatePickerPage extends StatelessWidget {
  DatePickerPage({
    Key? key,
  }) : super(key: key);
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2018, 3, 5),
                maxTime: DateTime(2022, 6, 7), onChanged: (date) {
              print('change $date in time zone ' + date.year.toString());
              text = date.toString();
            }, onConfirm: (date) {
              print('confirm $date');
            }, currentTime: DateTime.now(), locale: LocaleType.zh);
          },
          child: Text(
            'show date picker(custom theme &date time range)',
            style: TextStyle(color: Colors.blue),
          )),
    );
  }
}
