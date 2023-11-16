import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});
  @override
  State<PerguntasApp> createState() => PerguntaAppSatte();
}

class PerguntaAppSatte extends State<PerguntasApp> {
  int _index = 0;
  int _valorTotle = 0;

  final List<Map<String, Object>> listPerguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'resposta': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelhor', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'resposta': [
        {'Texto': 'Coelho', 'nota': 10},
        {'Texto': 'Cobra', 'nota': 5},
        {'Texto': 'Elefante', 'nota': 3},
        {'Texto': 'Leão', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'texto': 'Leo', 'nota': 10},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Maria', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ],
    }
  ];

  void responder() {
    setState(() {
      _index++;
      print(_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> lista = listPerguntas[_index]['resposta'] as List<Map<String, Object>>;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Perguntas App !'),
            ),
            body: Column(

              children: [
              Text(listPerguntas[_index]['texto'] as String), 
              ...lista.map((map) {
              return ElevatedButton(onPressed: responder, child: Text(map['texto'] as String));
            }).toList(),
            ],
            ),
            ), 
  
    );
  }
}
