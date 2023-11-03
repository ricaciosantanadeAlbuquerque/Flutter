import 'package:exe_perguntas14/questionario.dart';
import 'package:flutter/material.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
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
        {'texto': 'Leão', 'nota': 10},
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

  void _responder(int valor) {
    if (_temPerguntaSelecionada) {
      setState(() {
        _index++;
        _valorTotla += valor;
      });
    }
    print(_valorTotla);
  }

  bool get _temPerguntaSelecionada {
    return _index < _lista.length; // tamanho 3 (0 1 2)
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
          body: _temPerguntaSelecionada
              ? Questionario(
                  index: _index,
                  listaPerguntas: _lista,
                  onSelected: _responder,
                )
              : Resultado(pontuacao: _valorTotla,)),
    );
  }
}
