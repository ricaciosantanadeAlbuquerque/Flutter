import 'package:flutter/material.dart';
import 'package:perguntas02/questionario.dart';
import 'package:perguntas02/resultado.dart';

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
  int _valoTotal = 0;
  final List<Map<String,Object>> _lista = const [
    {
      'texto':'Qual é a sua cor favorita?',
      'resposta':[

        {'texto':'Preto','pontuacao':10},
        {'texto':'Vermelhor','pontuacao':5},
        {'texto':'Verde','pontuacao':3},
        {'texto':'Branco','pontuacao':1},
      ]
    },

    {
      'texto':'Qual é o seu animal favorito ?',
      'resposta':[

        {'texto':'Coelho','pontuacao':10},
        {'texto':'Cobra','pontuacao':5},
        {'texto':'Elefante','pontuacao':3},
        {'texto':'Leão','pontuacao':1},

      ]
      },
    {
      'texto':'Qual é o seu instrutor favorito ?',
      'resposta':[

        {'texto':'Leo','pontuacao':10},
        {'texto':'Maria','pontuacao':5},
        {'texto':'João','pontuacao':3},
        {'texto':'Pedro','pontuacao':1},

      ]},
  ];
// métodos============================================================================================================================

void _responder(int valor){
   if(temPergunta()){
     setState((){
      _index++;
      _valoTotal += valor;
    });
   }
}

bool temPergunta(){
  return  _index < _lista.length;
}

void resetar(){
 setState(() {
    _index = 0;
     _valoTotal = 0;
 });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme:ThemeData(
            primarySwatch:Colors.green
          ),
          home: Scaffold(
            appBar:AppBar(
              title:const Center(
                child:Text('Lista Perguntas !'),
              ),
            ),
            body: temPergunta() ? Questionario(funcao: _responder, index: _index, lista: _lista)
            :Resultado(funcao: resetar, pontuacao: _valoTotal)
          )
    );
  }
}
