import 'package:flutter/material.dart';
import 'package:perguntas01_1/questao.dart';
import 'package:perguntas01_1/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) p;

  const Questionario({required this.perguntas,required this.perguntaSelecionada,required this.p,super.key});

  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
    // operadores condicionais retornam valores booleano true ou false
  }
@override
  Widget build(BuildContext context){
  List<Map<String,Object>> resposta = temPerguntaSelecionada ? perguntas[perguntaSelecionada]['resposta'] as List<Map<String,Object>> : [];
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'] as String),
        ...resposta.map((map) => Resposta(texto: map['texto'] as String, p: (){
          p(map['pontuacao'] as int);
          }
          )
          ).toList()
      ]
    );
  }
}
