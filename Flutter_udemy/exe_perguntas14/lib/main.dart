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

  final List<Map<String, Object>> _lista = const [
    {
      'texto': 'Qual  é a sua cor favorita ?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu Animal favorito ?',
      'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual o seu instrutor favorito ?',
      'resposta': ['Maria', 'joão', 'Leo', 'Pedro']
    }
  ];

  void _responder() {
    if (_temPerguntaSelecionada) {
      setState(() {
        _index++;
      });
    }
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
              ? Questionario(index: _index,listaPerguntas:_lista,onSelected: _responder,)
              : const Resultado()
              ),
    );
  }
}
