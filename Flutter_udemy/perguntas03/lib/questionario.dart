import 'package:flutter/material.dart';
import 'package:perguntas03/perguntas.dart';
import 'package:perguntas03/resposta.dart';

class Questionario extends StatelessWidget {
  // atribultos de classe
  final List<Map<String, Object>> lista;
  final int index;
  final void Function(int) funcao;
// construto padrão, com parâmetros nomeados
  const Questionario({super.key, required this.funcao, required this.index, required this.lista});

// ================== métodos

  bool temPergunta() {
    return index < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listaMapa = temPergunta() ? lista[index]['resposta'] as List<Map<String, Object>> : [];
    List<Widget> widget = listaMapa
        .map((map) => Resposta(
            texto: map['texto'] as String,
            funcao: () {
              funcao(map['pontuacao'] as int);
            }))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Perguntas(texto: lista[index]['texto'] as String),
          ...widget // o operador Spread ... pega cada elemento da lista "widget" e joga um por um na lista column([]) 
          ],
   
      ),
    );
  }
}
