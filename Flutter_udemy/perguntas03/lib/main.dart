import 'package:flutter/material.dart';
import 'package:perguntas03/pergunta.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.blueGrey
      ),
      home: const PerguntaApp()
    );
  }
}
