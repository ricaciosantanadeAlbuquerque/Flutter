import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;
  const ChartBar({super.key, required this.label, required this.value, required this.percentage});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value.toString()),
        const SizedBox(height:5),
        Container(
          height:60,
          width:10,
          child: null
        ),
         const SizedBox(height: 5),
         Text(label)
      ]);
  }
}
