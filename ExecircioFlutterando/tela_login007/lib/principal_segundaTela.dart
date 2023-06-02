import 'package:flutter/material.dart';

import 'controle.dart';
import 'escolha.dart';
import 'linha.dart';

class Principal extends StatelessWidget {
  final int cont;
  final void Function() funcao;
  const Principal({super.key,required this.cont,required this.funcao});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: GestureDetector(
            child: Text("Contagem ${cont}"),
            onTap: funcao,
          ),
        ),
      ),
      Escolha(
          valor: Controle.instancia.valor,
          funcao: (valor) {
            Controle.instancia.mudar();
          }),
      Linha(),
    ]);
  }
}
