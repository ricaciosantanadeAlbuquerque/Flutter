import 'package:flutter/material.dart';
import 'package:revisao_pergumtas/questionario.dart';
import 'package:revisao_pergumtas/resultado.dart';

void main() => runApp(const Perguntas());

class Perguntas extends StatefulWidget {
  const Perguntas({super.key});
  @override
  PerguntasAppState createState() => PerguntasAppState();
}

class PerguntasAppState extends State<Perguntas> {
  int _index = 0;
  int _Valortotla = 0;
  final List<Map<String,Object>> _perguntas = const [

    {
      'texto':'Qual é a sua cor favorita ?',
      'resposta':[
        {'texto':'Preto','pontuacao':10},
        {'texto':'vermelhor','pontuacao':5},
        {'texto':'Verde','pontuacao':3},
        {'texto':'Branco','pontuacao':1}
      ]
    },

    {'texto':'Qual é o seu animal favorito ?',
     'resposta':[
      {'texto':'Coelho','pontuacao':10},
      {'texto':'Cobra','pontuacao':5},
      {'texto':'Elefante','pontuacao':3},
      {'texto':'Leão','pontuacao':1}
     ]
    },

    {'texto':'Qual é o seu instrutor favorito ?',
     'resposta':[
      {'texto':'Leo','pontuacao':10},
      {'texto':'Maria','pontuacao':5},
      {'texto':'João','pontuacao':3},
      {'texto':'Pedro','pontuacao':1},
     ]
    }
  ];

  void _resporder(int valor){
    setState(() {
      _index++;
      _Valortotla += valor;
    });
  }
  void _resetar(){
    setState(() {
      _index = 0;
      _Valortotla = 0;
    });
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
                child:Text("Perguntas !")
              )
            ),
            body: _temPergunta ? 
            Questionario(perguntas: _perguntas, index: _index, funcao: _resporder):
            Resultado(funcao: _resetar, valortotla: _Valortotla)
           )
    );
  }
}
