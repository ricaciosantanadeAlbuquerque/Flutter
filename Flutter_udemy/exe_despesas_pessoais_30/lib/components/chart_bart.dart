import 'package:flutter/material.dart';

class ChartBart extends StatelessWidget {
  final String label;
  final double value;
  final double perncentage;

  const ChartBart({super.key, required this.label, required this.value, required this.perncentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 17,
          child: FittedBox(
            child: Text(value.toStringAsFixed(2),
          ),
          ),
          ),
        const SizedBox(height:5),
        Container(
          height:60,
          width:10,
          child:Stack(
            alignment:Alignment.bottomCenter,
            children:[
              Container(
                decoration:BoxDecoration(
                  border:Border.all(
                    width:1.0,
                    color: Colors.grey
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: perncentage,
                child: Container(
                  decoration:BoxDecoration(
                    color:Theme.of(context).colorScheme.primary,
                    borderRadius:BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
         const SizedBox(height: 5),
         Text(label),
      ]
    );
  }
}
