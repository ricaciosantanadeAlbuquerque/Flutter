import 'package:exe_perguntas15/questao.dart';
import 'package:exe_perguntas15/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final int index;
  final List<Map<String, Object>> listaPergutas;
  final void Function() onSelected;
  const Questionario({super.key, required this.index, required this.listaPergutas, required this.onSelected});

  bool get temPerguntaSelecionada {
    return index < listaPergutas.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> lista = temPerguntaSelecionada ? listaPergutas[index]['resposta'] as List<Map<String, Object>> : [];
    return Column(
      children: [
        Questao(texto: listaPergutas[index]['texto'] as String),
        ...lista.map((map) {
          return Resposta(texto: map['texto'] as String, onSelected: onSelected);
        }).toList(),
      ],
    );
  }
}
