import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({super.key, required this.label, required this.percentage, required this.value});

  @override
  Widget build(BuildContext context) {
    print(percentage);
    return Column(children: [
      Text('R\$ ${value.toStringAsFixed(2)}'),
      const SizedBox(height: 5),
      Container(
          height: 60,
          width: 10,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5)),
            ),
            FractionallySizedBox(heightFactor: percentage , child: Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(5),),),)
          ])),
      const SizedBox(height: 5),
      Text(label)
    ]);
  }
}
