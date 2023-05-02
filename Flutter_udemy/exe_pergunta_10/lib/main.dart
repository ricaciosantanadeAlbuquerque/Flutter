import 'package:exe_pergunta_10/questionario.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int valorTotal = 0;
  final List<Map<String,Object>> _perguntas = const [

    {'texto':'Qual é a sua cor favorita ?',
     'resposta':[
      
      {'texto':'Preto','pontuacao':10},
      {'texto':'Vermelhor','pontuacao':5},
      {'texto':'Verde','pontuacao':3},
      {'texto':'Branco','pontuacao':1},

     ]

     },

    {'texto':'Qual o seu animal favorito ?',
     'resposta':[
        {'texto':'Coelho','pontuacao':10}, 
        {'texto':'Cobra','pontuacao':5}, 
        {'texto':'Elefante','pontuacao':3}, 
        {'texto':'Leão','pontuacao':1}
     ]
    },

    {
      'texto':'Qual é o seu instrutor favorito ?',
      'resposta':[
          {'texto':'Leo','pontuacao':10}, 
          {'texto':'Maria','pontuacao':5}, 
          {'texto':'João','pontuacao':3}, 
          {'texto':'Pedro','pontuacao':1}
      ],
    }
  ];

  void _responder(int valor){
    if(_temPergunta){
      setState(() {
        _index++;
        valorTotal += valor;
      });
    }
  }

bool get _temPergunta{
  return _index < _perguntas.length;
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Center(
            child:Text('Perguntas !')
          )
        ),
        body: _temPergunta ? Questionario(perguntas: _perguntas, funcao: _responder, index: _index)
        : Container(
          child:const Center(child: Text('Parabéns')
          )
        )
      )
    );
  }
}
