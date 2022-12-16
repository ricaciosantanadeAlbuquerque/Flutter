


import 'package:flutter/material.dart';

void main(){
runApp(Aula04_Revisao());
}


class Aula04_Revisao extends StatelessWidget{
  

@override
Widget build(BuildContext context){

  final  List<String> perguntas = ["Qual é a sua cor favorita?",
  "Qual é o seu animal favorita?"]; // lista de nome perguntas []

  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
      title: const Center( // center tem que ser uma constante ele não pode ser alterado em tempo de execução
        child: Text("Perguntas"),
      ),
      ),
      body: Column(
        children: <Widget> [
          Text(perguntas.elementAt(0)), // posição 0 da lista de widget pertencete a coluna
          const ElevatedButton( // botão um
            onPressed: null,
             child: Text("Resposta 1")
             ),
             const ElevatedButton( // botão dois 
              onPressed: null, 
              child: Text("Resposta 2")),
              const ElevatedButton(
                onPressed: null, 
                child: Text("Resposta 3"))
        ]
      )
    )
  );
}
}