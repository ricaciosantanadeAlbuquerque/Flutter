import 'package:flutter/material.dart';
import 'package:perguntas01_1/questionario.dart';
import 'package:perguntas01_1/resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

   final List<Map<String,Object>> _perguntas  = const [
    {
     'texto':'Qual é a sua Cor favorita?',
     'resposta':[
      {'texto':'Preto','pontuacao':10,},
      {'texto':'Vermelhor','pontuacao':5},
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
   {
    'texto':'Qual é o seu instrutor favorito?',
    'resposta':[
      {'texto':'Leo','pontuacao':10},
      {'texto':'Maria','pontuacao':5},
      {'texto':'João','pontuacao':3},
      {'texto':'Pedro','pontuacao':1}
    ]
   }
   ];

   void _responder(int pontuacao){

    if(temPerguntaSelecionada){
       setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
   }
  
  void reiniciar(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
    // operadores condicionais retornam valores booleano true ou false
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         home: Scaffold(
          appBar:AppBar(
            title:const Center(
              child: Text("Perguntas")
            )
          ),
          body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, p: _responder)
          : Resultado(ponto: _pontuacaoTotal, p: reiniciar)
         )
    );
  }
}

/**
 * TEXTO COMPONENTIZADO
 */
