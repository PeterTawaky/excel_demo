import 'package:excel_demo/model/tag_model.dart';
import 'package:flutter/material.dart';

class CustomVerticalList extends StatelessWidget {
  final List<TagModel> tags;
  const CustomVerticalList({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      children: List.generate(tags.length, (index) {
        return Container(
          color: Colors.teal,
          width: 300,
          child: Text(
            tags[index].value.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        );
      }),
    );
  }
}
