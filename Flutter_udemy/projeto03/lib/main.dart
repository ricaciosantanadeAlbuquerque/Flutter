import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
 final List<String> perguntas = ["Qual é a sua cor favorita ?"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title:const Center(
            child: Text("Pergunta")
          ),
        ),
        body:Column(
          children: <Widget>[
            Text(perguntas.elementAt(0)),
            ElevatedButton(onPressed:(){},child: const Text("Resposta 1 "),
            ),
            ElevatedButton(onPressed:(){},child:const Text("Resposta 2 ")),
            ElevatedButton(onPressed:(){},child:const Text("Resposta 3 "))
          ]
        )
      )
    );
  }
}
