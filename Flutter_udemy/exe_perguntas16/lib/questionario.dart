import 'package:exe_perguntas16/questao.dart';
import 'package:exe_perguntas16/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> listaPerguntas;
  final int index;
  final void Function(int) onSubmmitted;
  const Questionario({super.key, required this.index, required this.listaPerguntas, required this.onSubmmitted});

  bool get temPerguntaSelecionada {
    return index < listaPerguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> lista = temPerguntaSelecionada ? listaPerguntas[index]['resposta'] as List<Map<String, Object>> : [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Questao(
          texto: listaPerguntas[index]['texto'] as String,
        ),
        ...lista.map(
          (map) {
            return SizedBox(
              width: double.infinity,
              child: Resposta(
                texto: map['texto'] as String,
                onSelected: () {
                  onSubmmitted(map['pontuacao'] as int);
                },
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
