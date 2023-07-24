import 'package:exe_perguntas11/components/questao.dart';
import 'package:exe_perguntas11/components/resultado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});
  @override
  State<PerguntasApp> createState() => PerguntasAppSate();
}

class PerguntasAppSate extends State<PerguntasApp> {
  int index = 0;
  int valorTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita',
      'resposta': [
        {'texto': 'Preto', 'pontuaco': 10},
        {'texto': 'Vermelho', 'pontuaco': 5},
        {'texto': 'Verde', 'pontuaco': 3},
        {'texto': 'Branco', 'pontuaco': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito',
      'resposta': [
        {'texto': 'Coelho', 'pontuaco': 10},
        {'texto': 'Cobra', 'pontuaco': 5},
        {'texto': 'Elefante', 'pontuaco': 3},
        {'texto': 'Leão', 'pontuaco': 1}
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito',
      'resposta': [
        {'texto': 'Leo', 'pontuaco': 10},
        {'texto': 'Maria', 'pontuaco': 5},
        {'texto': 'João', 'pontuaco': 3},
        {'texto': 'Pedro', 'pontuaco': 1},
      ]
    },
  ];

  void _responder(int valor) {
    if (temPergunta == true) {
      setState(() {
        index++;
        valorTotal += valor;
      });
    }
  }

  bool get temPergunta {
    return index < _perguntas.length;
  }

  void resetar() {
    setState(() {
      index = 0;
      valorTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Perguntas'),
            ),
          ),
          body: temPergunta ? Questao(onSubmitted: _responder,
           index: index,
            lista: _perguntas) 
            : Resultado(total: valorTotal,
             onSubmitted: resetar),
          ),
    );
  }
}
