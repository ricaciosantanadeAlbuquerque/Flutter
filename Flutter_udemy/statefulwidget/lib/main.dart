
import 'package:flutter/material.dart';

void main() => runApp(_PerguntaApp());

class _PerguntaApp extends StatefulWidget{
  @override
  State<_PerguntaApp> createState() => PerguntaAppState();

}

class PerguntaAppState extends State<_PerguntaApp>{

   var _perguntaSelecionada = 0;

  final List<String> _perguntas = ["Qual a sua idade ","Qual o seu nível de escolaridade"];

  void Function() _funcao(){ // 
    return (){
        setState(() { // tudo que vai mudar deve está dentro de um setState((){})
          _perguntaSelecionada++;
        });
        print(_perguntaSelecionada);
    };
  }
   @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Perguntas")
          )
        ),
        body: Column(
          children: <Widget>[
            Text(_perguntas[_perguntaSelecionada]),
            ElevatedButton(onPressed:_funcao(),child: const Text("Perguntas 1 ")),
            ElevatedButton(onPressed:_funcao(),child:const Text("Perguntas 2 ")),
            ElevatedButton(onPressed:_funcao(),child:const Text("Perguntas 3 "))
          ]
        )
      )
    );
  }
}