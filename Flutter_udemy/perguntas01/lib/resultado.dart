import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontucao;
  final void Function() p;
  const Resultado({super.key, required this.pontucao,required this.p});

  String get fraseResultado {
    if (pontucao < 8) {
      return "Parabéns";
    } else if (pontucao < 12) {
      return "Você é bom !";
    } else if (pontucao < 16) {
      return "Impressionante";
    } else {
      return "Nível jedai!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          TextButton(
            onPressed: p,
           child: const Text("Reiniciar !",
           style:TextStyle(fontSize: 28,color: Colors.blue)
           ),

           )
        ],
      ),
    );
  }
}
