import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() onReset;

  const Resultado({super.key, required this.pontuacao, required this.onReset});

  String get fraseresultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante !';
    } else {
      return 'Nível jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
       Center(
        child: Text(fraseresultado,style:const TextStyle(fontSize:28)),
      ),
      TextButton(
        onPressed: onReset,
        child: const Text(
          'Resetar !!',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      )
    ]);
  }
}
