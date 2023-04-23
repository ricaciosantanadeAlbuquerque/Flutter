import 'package:flutter/material.dart';
import 'package:perguntas01/questao.dart';
import 'package:perguntas01/resposta.dart';

class Questionario extends StatelessWidget{

  final List<Map<String,Object>> pergunta;
  final int perguntaSelecionada;
  final void Function()? responder;

  const Questionario({super.key,required this.pergunta,required this.perguntaSelecionada,required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < pergunta.length; //operadores condicionais  retornam o valor booleano
  }
@override
Widget build(BuildContext context){

List<String> resposta = temPerguntaSelecionada ? pergunta[perguntaSelecionada]['resposta'] as List<String> : [];

  return Column(
              children: <Widget>[
                Questao(
                texto: pergunta[perguntaSelecionada]['texto'].toString()
                ),
                 ...resposta.map((texto) => Resposta(texto: texto, p: responder)).toList()
                 ]
                 );
}
}