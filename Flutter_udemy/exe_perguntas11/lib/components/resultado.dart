import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int total;
  final void Function() onSubmitted;

  Resultado({super.key, required this.total, required this.onSubmitted});

   get resultado {
    if (total <= 9) {
      return 'nível baixo';
    } else if (total <= 15) {
      return 'nível Médio';
    } else if (total <= 30) {
      return 'nível alto';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Text(resultado),
          const SizedBox(height:15),
          TextButton(onPressed: onSubmitted, child:const Text('Resert'),)
        
        ],),
    );
  }
}
