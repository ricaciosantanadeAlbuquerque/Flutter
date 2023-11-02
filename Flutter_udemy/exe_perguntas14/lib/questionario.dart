import 'package:exe_perguntas14/questao.dart';
import 'package:exe_perguntas14/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final int index;
  final List<Map<String, Object>> listaPerguntas;
  final void Function() onSelected;

  const Questionario({super.key, required this.index, required this.listaPerguntas, required this.onSelected});

  bool get temPerguntaSelecionada {
    return index < listaPerguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> listaRespostas = temPerguntaSelecionada ? listaPerguntas[index]['resposta'] as List<String> : [];
    return Column(
      children: [
        Questao(texto: listaPerguntas[index]['texto'] as String),
        ...listaRespostas.map((element) {
          return Resposta(texto: element, onSelected2: onSelected);
        }).toList()
      ],
    );
  }
}
