import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() resetar;
  const Resultado({super.key, required this.pontos, required this.resetar});

  String get fraseResultado {
    if (pontos < 8) {
      return 'Parabéns';
    } else if (pontos < 12) {
      return 'impressionante';
    } else if (pontos < 16) {
      return 'Mestre jedi';
    } else {
      return "Mestre";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(fraseResultado,
        style:const TextStyle(fontSize:28,color:Colors.black)),
        TextButton(
          onPressed: resetar,
          child: const Text('Resetar??',
          style:TextStyle(
            fontSize: 28,
            color:Colors.blue
          )),
        )
      ]),
    );
  }
}
