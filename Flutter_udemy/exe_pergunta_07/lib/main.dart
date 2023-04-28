import 'package:exe_pergunta_07/questao.dart';
import 'package:exe_pergunta_07/resposta.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

//=================================================================================

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

//==================================================================================

class PerguntaAppState extends State<PerguntaApp> {

  int index = 0;

  

  void responder(){
    setState(() {
      index++;
    });
  }
  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita ?',
        'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'texto': 'Qual é o seu animal favorito ?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leao']
      },
      {
        'texto': 'Qual é o seu instrutor favorito ?',
        'resposta': ['Maria', 'João', 'Leo', 'Pedro']
      }
    ];

    List<Widget> respostas = [];

    for (var valor in perguntas[index]['resposta'] as List<String>) {
      respostas.add(Resposta(texto: valor, funcao: responder));
    }

    return MaterialApp(
         home:Scaffold(
          appBar:AppBar(
            title:const Center(
              child:Text("Perguntas ! ")
            )
          ),
          body:Column(
            children: [
              Questao(texto: perguntas[index]['texto'] as String ),
              ...respostas
              /**
               * O
               */
            ]
          )
         )
    );
  }
}
