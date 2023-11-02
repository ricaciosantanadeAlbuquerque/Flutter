import 'package:exe_perguntas14/questao.dart';
import 'package:exe_perguntas14/resposta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int index = 0;

  final List<Map<String, Object>> lista = [
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

  void responder() {
    setState(() {
      index++;
    });
  }

  

  @override
  Widget build(BuildContext context) {
   final List<Widget> listaResposta = [];
    for (var element in lista[index]['resposta'] as List<String>) {
      listaResposta.add(
               Resposta(texto: element,onSelected: responder,)
         );
    }
    //List<String> listaResposta = lista[index]['resposta'] as List<String>;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
           Questao(texto: lista[index]['texto'] as String),
            ...listaResposta,
          ],
        ),
      ),
    );
  }
}
