import 'package:exe_pergunta_06/questao.dart';
import 'package:exe_pergunta_06/resposta.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {

  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();

}

class _PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;

  List<String> perguntas = ["Qual é a sua cor favorita !", 
  "Qual é o seu animal favorito",
   "Qual é o seu instrutor favorito !"];

  void _responder(){
    setState(() {
      _index++;
    });
  }
  
  bool get temPergunta {
    return _index < perguntas.length;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            title:const Center(
              child: Text(" Perguntas !")
            )
          ),
          body: temPergunta ? Column(
            children: [
              Questao(texto: perguntas[_index]),
              Resposta(texto: 'Resposta 1 ', funcao: _responder),
              Resposta(texto: 'Resposta 2 ', funcao: _responder),
              Resposta(texto: 'Resposta 3 ', funcao: _responder)
            ]
          )
          : Container(
            child:const Center(child: Text("FIM !",style: TextStyle(fontSize:28),))
          )
        )
    );
  }
}
