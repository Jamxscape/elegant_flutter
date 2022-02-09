import 'package:flutter/material.dart';

class MultipleChipGroup extends StatelessWidget {
  MultipleChipGroup({Key? key, required this.groupName, required this.filters})
      : super(key: key);
  final List<String> groupName;
  final List<String> filters;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 15,
            children: List.generate(groupName.length, (index) {
              return FilterChip(
                label: Text(groupName[index]),
                selected: filters.contains(groupName[index]),
                onSelected: (v) {
                  if (v) {
                    filters.add(groupName[index]);
                  } else {
                    filters.removeWhere((f) {
                      return f == groupName[index];
                    });
                  }
                },
              );
            }).toList(),
          ),
          Text('选中：${filters.join(',')}'),
        ],
      ),
    );
  }
}
