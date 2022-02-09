import 'package:elegant_flutter/picker/file_picker/file_picker.dart';
import 'package:elegant_flutter/picker/image%20picker/image_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

/// 多个项目选择
// ignore: must_be_immutable
class MultiplePickerPage extends StatelessWidget {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  List<Animal> _selectedAnimals = [Animal(id: 1, name: "Lion")];
  MultiplePickerPage({
    Key? key,
  }) : super(key: key);
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            _showMultiSelectDialog(context);
          },
          child: Text(
            'show date picker(custom theme &date time range)',
            style: TextStyle(color: Colors.blue),
          )),
    );
  }

  void _showMultiSelect(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheetField(
          items: _items,
          initialValue: _selectedAnimals,
          onConfirm: (values) {},
          maxChildSize: 0.8,
        );
      },
    );
  }

  void _showMultiSelectDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: _items,
          initialValue: _selectedAnimals,
          onConfirm: (List<Animal> values) {
            _selectedAnimals = values;
            print(_selectedAnimals);
          },
          title: Text('选择'),
          confirmText: Text('确定'),
          cancelText: Text('返回'),
        );
      },
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
