import 'package:excel_demo/logic/cubit/loading_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomVerticalList extends StatelessWidget {
  final List<String> dataCell;
  const CustomVerticalList({super.key, required this.dataCell});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      children: List.generate(dataCell.length, (index) {
        return Container(
          color: Colors.teal,
          width: 300,
          child: Text(dataCell[index]),
        );
      }),
    );
  }
}
