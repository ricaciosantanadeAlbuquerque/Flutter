import 'package:flutter/material.dart';
import 'package:perguntas01/questao.dart';
import 'package:perguntas01/resposta.dart';

void main() => runApp(const PerguntaApp());

// ---------------- StatefulWidget-------------------
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  _perguntaAppState createState() => _perguntaAppState();
}

//------------------Estado-------------------------------
class _perguntaAppState extends State<PerguntaApp>{
// =================================Atribultos de classe ==================================================
  var _perguntaSelecionada = 0;

  final List<String> pergunta = ["Qual a sua cor favorita ?","Qual é o seu animal favorito ? "];
//=====================================Métodos da classe====================================================
   _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar:AppBar(
        title:const Center(
          child: Text("Perguntas")
        )
      ),
      body:Column(
        children:<Widget>[
          Questao(texto: pergunta[_perguntaSelecionada]),
          
          Resposta(texto: "Resposta 1 ", p:_responder),
          Resposta(texto: "Resposta 2 ", p: _responder),
          Resposta(texto: "Resposta 3 ", p: _responder)
         
        ]
      )
    )
    );
  }
}
