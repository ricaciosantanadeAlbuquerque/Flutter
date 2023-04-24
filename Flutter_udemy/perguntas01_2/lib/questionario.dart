import 'package:flutter/material.dart';
import 'package:perguntas01_2/questao.dart';
import 'package:perguntas01_2/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> lista;
  final int contadora;
  final void Function(int) p;

  const Questionario({super.key, required this.lista, required this.contadora, required this.p});
  @override
  bool get temPergunta {
    return contadora < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergunta ? lista[contadora]['resposta'] as List<Map<String, Object>> : [];
    return Center(
      child: Column(children: [
        Questao(texto: lista[contadora]['texto'] as String),
        ...respostas
            .map((map) => Resposta(
                texto: map['texto'] as String,
                funcao: () {
                  p(map['pontuacao'] as int);
                }))
            .toList()
      ]),
    );
  }
}
