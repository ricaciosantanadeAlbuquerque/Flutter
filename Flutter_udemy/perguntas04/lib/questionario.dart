import 'package:flutter/material.dart';
import 'pergunta.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> lista;
  final int index;
  final void Function(int) funcao;

  const Questionario({super.key, required this.lista, required this.index, required this.funcao});

  bool get temItem {
    return index < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listMap = temItem ? lista[index]['resposta'] as List<Map<String, Object>> : [];
    return Column(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      children: [
      Perguntas(texto: lista[index]['texto'] as String),
      ...listMap
          .map((map) => Resposta(
                texto: map['texto'] as String,
                funcao: () {
                  funcao(map['pontuacao'] as int);
                },
              ))
          .toList()
    ]);
  }
}
