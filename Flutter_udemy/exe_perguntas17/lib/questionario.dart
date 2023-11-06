import 'package:exe_perguntas17/questao.dart';
import 'package:exe_perguntas17/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> listaPergunta;
  final int index;
  final void Function(int) onSelected;

  const Questionario({super.key, required this.index, required this.listaPergunta, required this.onSelected});

  @override
  Widget build(BuildContext context) {
  final List<Map<String, Object>> lista = listaPergunta[index]['resposta'] as List<Map<String, Object>>;
    return Column(
      children: [
        Questao(texto: listaPergunta[index]['texto'] as String),
        ...lista.map((map) {
        return Resposta(
          texto: map['texto'] as String,
          onSelected: () => onSelected,
        );
      }).toList()
      ]
    );
  }
}
