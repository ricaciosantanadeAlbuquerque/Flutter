import 'package:exe_pergunta_10/questao.dart';
import 'package:exe_pergunta_10/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int index;
  final void Function(int) funcao;

  const Questionario({super.key, required this.perguntas, required this.funcao, required this.index});

  bool get temPergunta {
    return index < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergunta ? perguntas[index]['resposta'] as List<Map<String, Object>> : [];
    return Column(children: [
      Questao(texto: perguntas[index]['texto'] as String),
      ...respostas
          .map((map) => Resposta(
              texto: map['texto'] as String,
              funcao: () {
                funcao(map['pontuacao'] as int);
              }))
          .toList()
    ]);
  }
}
