import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({super.key, required this.label, required this.value, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20, child: FittedBox(child: Text(value.toStringAsFixed(2)))),
      const SizedBox(height: 5),
      SizedBox(
        height: 60,
        width: 10,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromRGBO(220, 220, 220, 1),
              ),
            ),
            FractionallySizedBox(
              heightFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 5),
      Text(label),
    ]);
  }
}
