import 'package:exe_perguntas15/questionario.dart';
import 'package:exe_perguntas15/resultado.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valorTotla = 0;

  final List<Map<String, Object>> _lista = const [
    {
      'texto': 'Qual  é a sua cor favorita ?',
      'resposta': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual é o seu Animal favorito ?',
      'resposta': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual o seu instrutor favorito ?',
      'resposta': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Leo', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ]
    }
  ];

  void responder(int valor) {
    if (temPerguntaSelecionada) {
      setState(() {
        _index++;
        _valorTotla += valor;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _index < _lista.length;
  }

  void resetarPerguntas() {
    setState(() {
      _index = 0;
      _valorTotla = 0;
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
          body: 
          temPerguntaSelecionada ?
           Questionario(index: _index, listaPergutas: _lista, onSelected: responder) 
           : Resultado(pontuacao: _valorTotla,onReset: resetarPerguntas)),
    );
  }
}
