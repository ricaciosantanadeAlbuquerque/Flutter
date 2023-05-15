import 'package:flutter/material.dart';
import 'package:revisao_perguntas01/botao.dart';
import 'package:revisao_perguntas01/pergunta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> lista;
  final int index;
  final void Function(int) funcao;

  const Questionario({super.key, required this.funcao, required this.lista, required this.index});

  bool get temPergunta {
    return index < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listMap = temPergunta ? lista[index]['resposta'] as List<Map<String, Object>> : [];
    return Column(children: [
      Pergunta(texto: lista[index]['texto'] as String),
      ...listMap
          .map((map) => Botao(
              funcao: () {
                funcao(map['pontuacao'] as int);
              },
              texto: map['texto'] as String))
          .toList()
    ]);
  }
}
