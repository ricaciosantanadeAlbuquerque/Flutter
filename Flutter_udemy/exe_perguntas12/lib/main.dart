import 'package:exe_perguntas12/questao.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;
  final List<String> perguntas = [
    'Qual é a sua cor favorita ?',
    'Qual é o seu animal favorito ?',
  ];

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(texto: perguntas[perguntaSelecionada]),
            ElevatedButton(onPressed:responder,
            child: const Text('Resposta1'),
            ),
            ElevatedButton(onPressed:responder,
            child: const Text('Reposta2'),
            ),
            ElevatedButton(onPressed: responder,
            child:const Text('Resposta3'),
            ),
          ],
        ),
      ),
    );
  }
}
