import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp()); // new PerguntaApp()/ instância da classe pergunta app
}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Text("Olá Flutter"));
  }
}
