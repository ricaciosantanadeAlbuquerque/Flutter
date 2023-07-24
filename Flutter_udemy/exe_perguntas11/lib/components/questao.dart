import 'package:exe_perguntas11/components/perguntas.dart';
import 'package:exe_perguntas11/components/resposta.dart';
import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final void Function(int) onSubmitted;
  final List<Map<String, Object>> lista;
  final int index;

  const Questao({super.key, required this.onSubmitted, required this.index, required this.lista});

  bool get temPergunta {
    return index < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listMap = temPergunta ? lista[index]['resposta'] as List<Map<String, Object>> : [];
    return Container(
      width: double.infinity,
      child: Column(children: [
        Perguntas(texto: lista[index]['texto'] as String),
        ...listMap.map((map) {
          return Resposta(
            onSubmitted: () {
              onSubmitted(map['pontuaco'] as int);
            },
            texto: map['texto'] as String,
          );
        }).toList(),
      ]),
    );
  }
}
