import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int valortotla;
  final void Function() funcao;

  const Resultado({super.key, required this.funcao, required this.valortotla});

  String get nota {

    if (valortotla < 8) {
      return 'Parabéns !';
    } else if (valortotla < 12) {
      return 'Muito Bom !';
    } else if (valortotla < 16) {
      return 'Impressionante !';
    } else {
      return 'Nível Jedi !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(nota,style:const TextStyle(fontSize: 20),),
            const SizedBox(height: 15,),
            TextButton(onPressed: funcao, child:const Text('Resetar !')),
          ],
        ),
      ),
    );
  }
}
