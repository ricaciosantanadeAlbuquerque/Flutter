import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int index;
  final void Function() funcao;

  const Questionario({super.key,required this.perguntas, required this.funcao, required this.index});

    bool get temPergunta {
    return index < perguntas.length;
  }
  @override
  Widget build(BuildContext context) {

    List<String> respostas = temPergunta ? perguntas[index]['resposta'] as List<String> : [];
    List<Widget> widget = respostas.map((element) => Resposta(texto: element, funcao: funcao)).toList();


    return Column(children: [
      Questao(texto: perguntas[index]['texto'] as String), //   as String e uma type Casting
      ...widget
    ]);
  }
}
