import 'package:flutter/material.dart';

void main() {}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valorTotle = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Center(
            child: Text('Perguntas'),
          ),
        ),
        body:const Column(
          children: [
            
          ]
        )
      )
    );
  }
}
