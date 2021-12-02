import 'dart:convert';

import 'package:azlistview/azlistview.dart';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Contact extends ISuspensionBean {
  Contact({
    this.id,
    this.userName,
    this.photo,
    this.phoneNum,
    this.cardID,
    this.remark,
    this.namePinyin,
    this.tagIndex,
  });

  factory Contact.fromJson(Map<String, dynamic> jsonRes) => Contact(
        id: asT<int?>(jsonRes['id']),
        userName: asT<String?>(jsonRes['userName']),
        photo: asT<String?>(jsonRes['photo']),
        phoneNum: asT<String?>(jsonRes['phoneNum']),
        cardID: asT<String?>(jsonRes['cardID']),
        remark: asT<String?>(jsonRes['remark']),
      );

  int? id;
  String? userName;
  String? photo;
  String? phoneNum;
  String? cardID;
  String? remark;
  String? tagIndex;
  String? namePinyin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  String getSuspensionTag() => tagIndex!;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userName': userName,
        'photo': photo,
        'phoneNum': phoneNum,
        'cardID': cardID,
        'remark': remark,
      };

  Contact clone() => Contact.fromJson(toJson());
}
