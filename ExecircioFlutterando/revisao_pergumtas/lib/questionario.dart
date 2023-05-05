import 'package:flutter/material.dart';
import 'package:revisao_pergumtas/questao.dart';
import 'package:revisao_pergumtas/respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int index;
  final void Function(int) funcao;

  const Questionario({super.key,required this.perguntas, required this.index, required this.funcao});

  bool get temPergunta {
    return index < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listaMap = temPergunta ? perguntas[index]['resposta'] as List<Map<String, Object>> : [];

    return Column(
      //mainAxisAlignment:MainAxisAlignment.center,
      children: [
      Questao(texto: perguntas[index]['texto'] as String),
      ...listaMap
          .map((map) => RespostaBotao(
              texto: map['texto'] as String,
              funcao: () {
                funcao(map['pontuacao'] as int);
              }))
          .toList()
    ]);
  }
}
