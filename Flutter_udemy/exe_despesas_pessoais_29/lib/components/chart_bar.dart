import 'package:flutter/material.dart';

class ChartBart extends StatelessWidget {

  final String label;
  final double value;
  final double percentagem;

  const ChartBart({super.key,required this.label, required this.value, required this.percentagem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:20,
          child: FittedBox(
            child: Text(value.toStringAsFixed(2)),),
        ),
        const SizedBox(
          height:5,
        ),
        Container(
          height:60,
          width:10,
          child: Stack(
            alignment:Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width:1,
                    color: Colors.grey,
                  ),
                  color: const Color.fromRGBO(220,220,220,1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor:percentagem,
                child: Container(
                decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
            ),
        ),
         const SizedBox(
        height: 5,
      ),
      Text(label),
      ],
    );
  }
}