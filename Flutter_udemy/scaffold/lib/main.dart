
import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp()); // main está  como uma função Arrow

class PerguntaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  const Center(
            child: Text("Perguntas")
            )
        ),
        body:const Text("Olá Flutter!!!",
        style:TextStyle(
          fontSize:20.0
        )
        )
      )
    );
  }
}
