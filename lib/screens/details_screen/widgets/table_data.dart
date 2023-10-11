import 'package:flutter/material.dart';
import 'package:sqflite_food_warehouse/core/constants/constants.dart';

class TableData extends StatelessWidget {
  const TableData({
    super.key,
    required this.firstElement,
    required this.secondELement,
  });

  final String firstElement;
  final String secondELement;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstElement,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(
          height: InsetsConstants.small,
        ),
        Text(
          secondELement,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}