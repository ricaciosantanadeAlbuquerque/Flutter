import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp(titulo: "Olá Flutter !!",));
}

class PerguntaApp extends StatelessWidget {
  final String titulo;
  const PerguntaApp({super.key,required this.titulo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Perguntas")
          )
        ),
        body:  Text(titulo)
      )
    );
  }
}
