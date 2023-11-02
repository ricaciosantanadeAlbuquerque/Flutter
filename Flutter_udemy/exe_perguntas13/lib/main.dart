import 'package:exe_perguntas13/resposta.dart';
import 'package:flutter/material.dart';

import 'questao.dart';

void main() => runApp(const PerguntasApp());

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({
    super.key,
  });

  @override
  PerguntasAppState createState() => PerguntasAppState();
}

class PerguntasAppState extends State<PerguntasApp> {
  int index = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'resposta': ['Preto', 'vermelhor', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu  animal favorito ?',
      'resposta': ['Coelho', 'cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'resposta': ['Maria', 'João', 'Leo', 'Pedro']
    }
  ];

  void responder() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
     final lista  = _perguntas[index]['resposta'] as List<String>;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  const Center(
            child: Text('Perguntas'),
            ),    
        ),
        body: Column(
          children: [
            Questao(texto: _perguntas[index]['texto'] as String),
            ...lista.map((element){
              return Resposta(texto: element, onSelected: responder);
            }).toList(),
            ],
        ),
      ),
    );
  }
}
