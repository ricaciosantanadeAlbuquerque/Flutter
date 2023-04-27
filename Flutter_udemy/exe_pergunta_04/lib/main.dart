import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp());
}
//============STATEFUL========================================================================
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}
// ============ESTADO==========================================================================
class PerguntaAppState extends State<PerguntaApp> {
     int index= 0;


  void responder(){
    setState((){
      index++;
    });
  }


  @override
  Widget build(BuildContext context) {

    List<String> perguntas = [
      "Qual é a sua cor favorita !",
      "Qual é o seu animal favorito !",
      "Qual é o seu instrutor favorito !"
    ];


    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:const Center(
            child:Text("Perguntas")
          )
        ),
        body:Column(
          children: [
            Text(perguntas[index]),
            ElevatedButton(onPressed: responder,child:const Text('Resposta 1 ')),
            ElevatedButton(onPressed: responder,child:const Text('Resposta 2 ')),
            ElevatedButton(onPressed: responder,child:const Text('Resposta 3'))
          ]
        )
      )
    );
  }
}
