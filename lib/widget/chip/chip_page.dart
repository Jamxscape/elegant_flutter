import 'package:elegant_flutter/widget/chip/chip_controller.dart';
import 'package:elegant_flutter/widget/chip/multiple_chip_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class ChipPage extends StatelessWidget {
  ChipPage({
    Key? key,
  }) : super(key: key);
  ChipController controller = ChipController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标签选择"),
      ),
      body: Container(
          child: ListView(
        children: [
          Row(
            children: [
              RawChip(
                label: Text('苹果'),
              ),
              RawChip(
                label: Text('禁用'),
                isEnabled: false,
              ),
              RawChip(
                avatar: CircleAvatar(
                  foregroundColor: Colors.red,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.wb_sunny,
                  ),
                ),
                label: Text('晴天'),
              ),
              RawChip(
                label: Text('删除'),
                onDeleted: () {
                  print('onDeleted');
                },
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,
                deleteButtonTooltipMessage: '删除',
              ),
              RawChip(
                label: Text('改变形状'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 10),
              )
            ],
          ),
          Row(children: [
            Obx(() {
              return RawChip(
                label: Text('选择'),
                selected: controller.isSelected.value,
                onSelected: (v) {
                  controller.isSelected.value = v;
                },
                showCheckmark: true,
                selectedColor: Colors.blue,
                selectedShadowColor: Colors.red,
                checkmarkColor: Colors.red,
              );
            }),
            InputChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: const Text('I'),
                ),
                label: const Text('InputChip'),
                onPressed: () {
                  print('I am the one thing in life.');
                }),
            RawChip(
              label: Text('Rawchip test'),
              selected: controller.isSelected.value,
              onSelected: (v) {
                controller.isSelected.value = v;
              },
              showCheckmark: true,
              selectedColor: Colors.blue,
              selectedShadowColor: Colors.red,
              checkmarkColor: Colors.red,
            ),
          ]),
          Text('单选标签'),
          Obx(() {
            return Wrap(spacing: 15, children: [
              ChoiceChip(
                label: Text('苹果'),
                selected: controller.radioSelected.value == 1,
                onSelected: (v) {
                  controller.radioSelected.value = 1;
                },
              ),
              ChoiceChip(
                label: Text('梨'),
                selected: controller.radioSelected.value == 2,
                onSelected: (v) {
                  controller.radioSelected.value = 2;
                },
              ),
              ChoiceChip(
                label: Text('西瓜'),
                selected: controller.radioSelected.value == 3,
                onSelected: (v) {
                  controller.radioSelected.value = 3;
                },
              ),
              ChoiceChip(
                label: Text('菠萝'),
                selected: controller.radioSelected.value == 4,
                onSelected: (v) {
                  controller.radioSelected.value = 4;
                },
              ),
              ChoiceChip(
                label: Text('橘子'),
                selected: controller.radioSelected.value == 5,
                onSelected: (v) {
                  controller.radioSelected.value = 5;
                },
              ),
              ChoiceChip(
                label: Text('火龙果'),
                selected: controller.radioSelected.value == 6,
                onSelected: (v) {
                  controller.radioSelected.value = 6;
                },
              ),
            ]);
          }),
          Text('多选标签'),
          Obx(() {
            return Wrap(
              spacing: 15,
              children: [
                FilterChip(
                  label: Text('苹果'),
                  selected: controller.filters.contains('苹果'),
                  onSelected: (v) {
                    if (v) {
                      controller.filters.add('苹果');
                    } else {
                      controller.filters.removeWhere((f) {
                        return f == '苹果';
                      });
                    }
                  },
                ),
                FilterChip(
                  label: Text('梨'),
                  selected: controller.filters.contains('梨'),
                  onSelected: (v) {
                    if (v) {
                      controller.filters.add('梨');
                    } else {
                      controller.filters.removeWhere((f) {
                        return f == '梨';
                      });
                    }
                  },
                ),
                Text('选中：${controller.filters.join(',')}'),
              ],
            );
          }),
          Obx(() {
            print(controller.filtersGroup);
            return MultipleChipGroup(groupName: [
              '苹果',
              '桃子',
              '李子',
              '椰子',
            ], filters: controller.filtersGroup);
          })
        ],
      )),
    );
  }
}
