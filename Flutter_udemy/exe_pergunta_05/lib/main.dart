import 'package:exe_pergunta_05/questao.dart';
import 'package:flutter/material.dart';

void main(){
 runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget{
  const PerguntaApp({super.key});
  @override
   PerguntaAppState createState() => PerguntaAppState();
}


class PerguntaAppState extends State<PerguntaApp>{
   int index = 0;

   void responder(){
    setState(() {
      index++;
    });
   }



  @override
  Widget build(BuildContext context){

    List<String> Perguntas = [
      "Qual é a sua cor favorita !",
      "Qual é o seu animal favorito !",
      "Qual é o seu instrutor favorito !"
      ];

   return MaterialApp(
        home:Scaffold(
          appBar:AppBar(
            title:const Center(
              child:Text("Perguntas ! ")
            )
          ),
          body:Column(
            children: [
              Questao(texto: Perguntas[index]),// conforme os valores do parâmetro muda, 'Questão' é Ré-rederizada
              ElevatedButton(onPressed:responder,child:const Text("Resposta 1 ")),
              ElevatedButton(onPressed:responder,child:const Text('Resposta 2 ')),
              ElevatedButton(onPressed:responder,child:const Text('Resposta 3 ')),
            ]
          )
        )
   );
  }
}