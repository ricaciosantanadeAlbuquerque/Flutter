import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Text('Fim da lista !',
        style: TextStyle(
          fontSize:28
        ),),
        ),
     );
  }
}
