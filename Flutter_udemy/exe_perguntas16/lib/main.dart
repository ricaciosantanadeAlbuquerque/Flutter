import 'package:exe_perguntas16/questao.dart';
import 'package:exe_perguntas16/resposta.dart';
import 'package:exe_perguntas16/resultado.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valorTotla = 0;

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
    if (temPerguntaSelecionada) {
      setState(() {
        _index++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _index < _listaPerguntas.length;
  }

  void resetPerguntas() {
    setState(() {
      _index = 0;
      _valorTotla = 0;
    });
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
        body: temPerguntaSelecionada
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Questao(
                    texto: _listaPerguntas[_index]['texto'] as String,
                  ),
                  ...lista.map(
                    (map) {
                      return SizedBox(
                        width: double.infinity,
                        child: Resposta(
                          texto: map['texto'] as String,
                          onSelected: _responder,
                        ),
                      );
                    },
                  ).toList(),
                ],
              )
            : Resultado(
                nota: _valorTotla, // comunicação direta
                onReset: resetPerguntas, // comunicao indireta
              ),
      ),
    );
  }
}
