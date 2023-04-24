import 'package:flutter/material.dart';
import 'package:perguntas01_2/questao.dart';
import 'package:perguntas01_2/resposta.dart';

void main(){
  runApp( const PerguntasApp());
}

class PerguntasApp extends StatefulWidget{
   const PerguntasApp({super.key});
  @override
  State<PerguntasApp> createState(){
    return PerguntasAppState();
  }
}


class PerguntasAppState extends State<PerguntasApp>{
  var contadora = 0;
  var valorTotal = 0;

  final List<Map<String,Object>> lista = const [
    {
      'texto': 'Qual a sua cor favorita ?',
      'resposta':[
        {'texto':'Preto','pontuacao':10},
        {'texto':'Vermelhor','pontuacao':5},
        {'texto':'Verde','pontuacao':3},
        {'texto':'Branco','pontuacao':1}
      ]
    },

    {
     'texto':'Qual é o seu animal favorito ?',
     'resposta':[
      {'texto':'Coelho','pontuacao':10},
      {'texto':'Cobra','pontuacao':5},
      {'texto':'Elefante','pontuacao':3},
      {'texto':'Leão','pontuacao':1}
     ]
    },

    {
     'texto':'Qual é o seu instrutor favorito',
     'resposta':[
      {'texto':'Leo','pontuacao':10},
      {'texto':'Maria','pontuacao':5},
      {'texto':'João','pontuacao':3},
      {'texto':'Pedro','pontuacao':1}
     ]
    },

  ];

  void andarLista(int pontuacao){
    setState((){
      contadora++;
      valorTotal += pontuacao;
    });
  }

 bool get temPergunta{
  return contadora < lista.length;
 }

  @override
  Widget build(BuildContext context){
    List<Map<String,Object>> respostas = temPergunta ? lista[contadora]['resposta'] as List<Map<String,Object>> : [];
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Center(
            child:Text('Pergunstas')
          )
        ),
        body:Center(
          child: Column(
            children: [
             Questao(texto: lista[contadora]['texto'] as String ),
              ...respostas.map((map) => Resposta(texto: map['texto'] as String, funcao: (){})).toList()
            ]
          ),
        )

      )
    );
  }
}