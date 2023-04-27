import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});
  @override
  Widget build(BuildContext context) {

    final List<String> Perguntas = [
      "Qual é a sua cor favorita ?",
      "Qual é o seu animal favorito ? "
    ];

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Center(
            child:Text("Perguntas")
          )
        ),
        body:Column(
          children: [
            Text(Perguntas[0]),
            ElevatedButton(
              onPressed:(){},
              child:const Text("Resposta 1 "),
            ),
            ElevatedButton(
            onPressed:(){},
            child:const Text("Resposta 2 ")
            ),
            ElevatedButton(
              onPressed:(){},
              child:const Text("Resposta 3 ")
            )
          ]
        )
      )
    );
  }
}
