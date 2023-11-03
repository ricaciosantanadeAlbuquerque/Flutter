import 'package:exe_perguntas14/questao.dart';
import 'package:exe_perguntas14/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final int index;
  final List<Map<String, Object>> listaPerguntas;
  final void Function(int) onSelected;

  const Questionario({super.key, required this.index, required this.listaPerguntas, required this.onSelected});

  bool get temPerguntaSelecionada {
    return index < listaPerguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> listaRespostas = temPerguntaSelecionada ? listaPerguntas[index]['resposta'] as List<Map<String,Object>> : [];
    return Column(
      children: [
        Questao(texto: listaPerguntas[index]['texto'] as String),
        ...listaRespostas.map((map) {
          return Resposta(texto: map['texto'] as String , onSelected2: () => onSelected(map['nota'] as int));
        }).toList()
      ],
    );
  }
}
