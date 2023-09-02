import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
runApp(new Aula03());
}

class Aula03 extends StatelessWidget{
final List<String> perguntas =["pergunta 1"];

Widget build(BuildContext context){
  return MaterialApp(

    home: Scaffold(

      appBar: AppBar(
        title: const Text("Perguntas!"),
      ),

      body: Column(
        children: [
          Text(perguntas[0]),
          const ElevatedButton( 
            onPressed:  null, 
            child:Text("Botão 1 ")),
            
            ElevatedButton(
              child: Text("Botão 2"),
              onPressed: null,
            ),
            ElevatedButton(
              child:Text("Botão 3"),
              onPressed: null,
              ),
              
        ]
            )
        
      ),
    );

}
}