import 'package:exe_perguntas17/questao.dart';
import 'package:exe_perguntas17/resposta.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valor = 0;

  final List<Map<String, Object>> listaPergunta = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu Animal favorito ?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'resposta': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
  ];

  void _responder() {
    setState(() {
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ]),
      ),
    );
  }
}
