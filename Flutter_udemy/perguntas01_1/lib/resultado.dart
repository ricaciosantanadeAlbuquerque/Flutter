import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int ponto;
  final void Function() p;
  const Resultado({super.key, required this.ponto, required this.p});

  String get fraseRseultado {
    if (ponto < 8) {
      return 'Parabéns';
    } else if (ponto < 12) {
      return 'Você é bom !';
    } else if (ponto < 16) {
      return 'Impressionante';
    } else {
      return "Nível jedai";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(fraseRseultado,
            style: const TextStyle(
              fontSize: 28,
            )),
        TextButton(onPressed: p, child: const Text("Reiniciar !", style: TextStyle(fontSize: 28, color: Colors.blue)))
      ],
    );
  }
}
