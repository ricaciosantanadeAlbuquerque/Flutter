import 'package:exe_pergutas18/questao.dart';
import 'package:exe_pergutas18/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> listaPerguntas;
  final int index;
  final void Function(int) returnValue;

  const Questionario({super.key, required this.listaPerguntas, required this.index, required this.returnValue});

  bool get temPerguntaSelecionada => index < listaPerguntas.length;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> lista = temPerguntaSelecionada == true ? listaPerguntas[index]['respostas'] as List<Map<String, Object>> : [];
    return Column(children: [
      Questao(texto: listaPerguntas[index]['texto'] as String),
      ...lista.map((map) {
        return Resposta(
            texto: map['texto'] as String,
            onPressed: () {
              returnValue(map['nota'] as int);
            });
      }),
    ]);
  }
}
