
import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

void main() =>  runApp(const PerguntaApp());


class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState  createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;

  final List<Map<String,Object>> _perguntas = const [
    {
     'texto':'Qual é a sua cor favorita ?',
      'resposta':['Preto','vermelhor','Verde','Branco']     
    },

    {
      'texto':'Qual é o seu animal favorito ?',
      'resposta':['Coelho','Cobra','Elefante','Leão']
    },
      
    {
     'texto':'Qual é o seu instrutor favorito',
     'resposta':['Maria','João','Leo','pedro']
    }

  ];

  void _responder(){
      if(temPergunta){
        setState(() {
        _index++;
      });
      }
  }

   bool get temPergunta{
      return _index < _perguntas.length;
    }

  @override
  Widget build(BuildContext context){

    List<String> respostas = _perguntas[_index]['resposta'] as List<String>;
    List<Widget> widget = respostas.map((element) => Resposta(texto: element, funcao: _responder)).toList();



    return MaterialApp(
      home:Scaffold(
         appBar:AppBar(
          title: const Center(
            child:  Text('perguntas'),
          ),
         ),
         body:Column(
          children:[
              Questao(texto: _perguntas[_index]['texto'] as String), //   as String e uma type Casting
              ...widget
          ]
         )
      )
    );
  }
}
