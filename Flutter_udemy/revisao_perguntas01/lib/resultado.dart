import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int ponto;
  final void Function() funcao;

  const Resultado({super.key, required this.funcao, required this.ponto});
  String nota() {
    if (ponto < 12) {
      return 'parabéns';
    } else if (ponto < 16) {
      return 'Muito bom !';
    } else if (ponto < 20) {
      return ' nível Mestre';
    } else if (ponto < 30) {
      return 'nível Mestre++';
    } else {
      return 'Seu nível é fora do normal';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Text(nota(),
        style:const TextStyle(
          fontSize:28,
          color:Colors.red
        ),), // chamada a função nota();
        ElevatedButton(
          onPressed: funcao,
          child: const Text("Resetar"),
        ),
      ]),
    );
  }
}
