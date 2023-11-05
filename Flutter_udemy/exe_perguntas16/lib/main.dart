import 'package:exe_perguntas16/questao.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valorTotle = 0;

  final List<Map<String, Object>> _listaPerguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
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
        {'texto': 'joão', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    }
  ];

  void _responder() {
    if(temPerguntaSelecionada){
      setState(() {
        _index++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _index < _listaPerguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> lista = temPerguntaSelecionada ? _listaPerguntas[_index]['resposta'] as List<Map<String, Object>> : [];
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada ? 
        Column(
          children: [
            Questao(texto: _listaPerguntas[_index]['texto'] as String,),
            ...lista.map(
              (map) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _responder,
                    child: Text(map['texto'] as String),
                  ),
                );
              },
            ).toList(),
          ],
        )
        :
        Container(
          child: const  Center(
            child: Text(' fim !'), 
          ),
        ),
      ),
    );
  }
}
