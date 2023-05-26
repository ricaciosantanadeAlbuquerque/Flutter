import 'package:flutter/material.dart';
import 'package:perguntas02/pergunta.dart';
import 'package:perguntas02/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> lista;
  final int index;
  final void Function(int) funcao;

  const Questionario({super.key, required this.funcao, required this.index, required this.lista});

  bool get temPergunta {
    return index < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listaMap = temPergunta ? lista[index]['resposta'] as List<Map<String, Object>> : [];
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(children: [
        Pergunta(texto: lista[index]['texto'] as String),
        ...listaMap
            .map((map) => Resposta(
                texto: map['texto'] as String,
                funcao: () {
                  funcao(map['pontuacao'] as int);
                }))
            .toList()
      ]),
    );
  }
}
