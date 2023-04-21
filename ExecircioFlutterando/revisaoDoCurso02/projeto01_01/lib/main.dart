import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatelessWidget {
 const PerguntaApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
         appBar:AppBar(
           title: const Center(child: Text("Perguntas"))
         ),
         body: Center(
           child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: const [
             Text("Olá Flutter !")
            ],
           ),
         )
      )
    );
  }
}
