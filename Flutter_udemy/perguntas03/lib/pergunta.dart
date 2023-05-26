import 'package:flutter/material.dart';

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valorTotal = 0;
  final List<Map<String, Object>> _lista = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelhor', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'resposta': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ]
    },
  ];
  //====================================Métodos================================================

  void _mudar() {
    if(temItemNaLita){
      setState(() {
        _index++;
      });
    }
  }

  bool get temItemNaLita {  // enquento houver index tem valor
    return _index < _lista.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Perguntas!'),
          ),
        ),
        body: Column(
          children: [],
        ));
  }
}
