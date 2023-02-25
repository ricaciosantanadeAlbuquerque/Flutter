import 'package:flutter/material.dart';

import 'componenteText.dart';

void main() => runApp(PerguntaApp());



class PerguntaApp  extends StatefulWidget{
   @override
  State<PerguntaApp> createState() => _PerguntaAppState();

}

class _PerguntaAppState extends State<PerguntaApp>{

  final List<String> _perguntas = ["Qual a sua idade ?","Qual o seu nível de escolaridade "];

   var _perguntaSelecionada = 0;

    void Function() _funcao(){
        return (){
          setState(() {
            _perguntaSelecionada++;
          });
        };
    }
    @override
    Widget build(BuildContext context){
      return MaterialApp(
         home: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text("Perguntas?")
              )
            ),
            body:Column(
              children: [
                Questao(texto: _perguntas[_perguntaSelecionada],),
                ElevatedButton(onPressed:_funcao(),child:const Text("Pergunta 1")),
                ElevatedButton(onPressed:_funcao(),child:const Text("Pergunta 2")),
                ElevatedButton(onPressed:_funcao(),child: const Text("Pergunta 3"))
              ]
            )
         )
      );
    }

}