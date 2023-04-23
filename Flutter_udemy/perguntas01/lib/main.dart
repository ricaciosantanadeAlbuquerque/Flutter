import 'package:flutter/material.dart';
import 'package:perguntas01/questao.dart';
import 'package:perguntas01/resposta.dart';
import 'package:perguntas01/resultado.dart';

void main() => runApp(const PerguntaApp());

// ---------------- StatefulWidget-------------------
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  _perguntaAppState createState() => _perguntaAppState();
}

//------------------Estado-------------------------------
class _perguntaAppState extends State<PerguntaApp> {
// =================================Atribultos de classe ==================================================
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _pergunta = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'resposta': ['Maria', 'joão', 'Leo', 'Pedro']
    }
  ];
//=====================================Métodos da classe====================================================
  _responder() {
   if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
   }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length; //operadores condicionais  retornam o valor booleano
  }

  @override
  Widget build(BuildContext context) {
    List<String> lista = temPerguntaSelecionada ? _pergunta[_perguntaSelecionada]['resposta'] as List<String> : [];
    List<Widget> widgets = lista.map((texto) => Resposta(texto: texto, p: _responder)).toList();
    /* for (String element in pergunta[_perguntaSelecionada]['resposta'] as List){ // necessário pitar o retono como uma lista.

      resposta.add(Resposta(texto: element, p: _responder));
    } */

    return MaterialApp(
      home: 
      Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Perguntas")
            )
            ), body: temPerguntaSelecionada ? Column(
              children: <Widget>[Questao(
                texto: _pergunta[_perguntaSelecionada]['texto'].toString()),
                 ...widgets]
                 ) : Resultado() 
                 )
                 );
  }
}
/**
 * ... operador spred pega cada elemento da lista resposta e joga para dentro da lista  de column()
 */