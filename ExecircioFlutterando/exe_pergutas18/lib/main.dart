import 'package:exe_pergutas18/Resultado.dart';
import 'package:exe_pergutas18/questao.dart';
import 'package:exe_pergutas18/questionario.dart';
import 'package:exe_pergutas18/resposta.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntasApp());

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  State<PerguntasApp> createState() => PerguntasAppState();
}

class PerguntasAppState extends State<PerguntasApp> {
  int _index = 0;
  int _valorTotla = 0;

  final List<Map<String, Object>> listPerguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual é o seu intrutor favorito ?',
      'respostas': [
        {'texto': 'Leo', 'nota': 10},
        {'texto': 'Maria', 'nota': 5},
        {'texto': 'João', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ]
    }
  ];

  void responder(int valor) {
    setState(() {
      _index++;
      _valorTotla += valor;
    });
  }

  bool get temPerguntaSelecionada {
    return _index < listPerguntas.length;
  }

  void resetar() {
    setState(() {
      _index = 0;
      _valorTotla = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada == true
            ? Questionario(
                listaPerguntas: listPerguntas,
                index: _index,
                returnValue: responder,
              )
            :  Resultado(valorTotla: _valorTotla,onChanged: resetar),
      ),
    );
  }
}
