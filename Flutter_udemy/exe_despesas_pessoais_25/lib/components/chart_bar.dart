

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  const ChartBar({super.key, required this.label, required this.value, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        FittedBox(child: Text(value.toStringAsFixed(2))),
       const SizedBox(height: 5,),
       SizedBox(
        height:60,
        width:10,
        child: Stack(
          alignment:Alignment.bottomCenter,
          children:[
            Container(
              decoration:BoxDecoration(
                border: Border.all(
                  width:1,
                  color:Colors.black
                ),
                color:const Color.fromRGBO(220, 220, 220, 1),
                borderRadius:BorderRadius.circular(5)
              ),
            ),
            FractionallySizedBox(
              heightFactor:percent.isNaN ? 0 : percent, // isNaN == valor Não-Número
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple, 
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            )
          ],
        ),
       ),
       const SizedBox(height: 5,),
       Text(label)
      ]
    );
  }
}
