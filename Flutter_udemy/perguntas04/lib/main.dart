import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PerguntasApp(),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});
  @override
  State<PerguntasApp> createState() => PerguntasAppState();
}

class PerguntasAppState extends State<PerguntasApp> {
  int _index = 0;
  int _valorTotla = 0;
  final List<Map<String, Object>> lista = const [

    {'texto':'Qual é a sua cor favorita ?',
    'resposta':[
      {'texto':'Preto','pontuacao':10},
      {'texto':'Vermelho','pontuacao':5},
      {'texto':'Verde','pontuacao':3},
      {'texto':'Branco','pontuacao':1},
    ]

    },

    {
      'texto':'Qual é o seu animal favorito?',
      'resposta':[
        {'texto':'Coelho','pontuacao':10},
        {'texto':'Cobra','pontuacao':5},
        {'texto':'Elefante','pontuacao':3},
        {'texto':'Leão','pontuacao':1}
      ]
    },

    {'texto':'Qual é o seu instrutor favorito?',
     'resposta':[
      {'texto':'Maria','pontuacao':10},
      {'texto':'João','pontuacao':5},
      {'texto':'Leo','pontuacao':3},
      {'texto':'Pedro','pontuacao':1},
     ]},
  ];

  void resposta(int valor){
    setState(() {
      _index++;
      _valorTotla += valor;
      print(_index);
    });
  }

  bool get temItem{
    return _index < lista.length;
  }

  void reset(){
    setState(() {
      _index = 0;
      _valorTotla = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Perguntas')
          )
          ),
          body: temItem ? Questionario(lista: lista, index: _index, funcao: resposta )
          :Resultado(funcao: reset, valor: _valorTotla)
          );
  }
}
