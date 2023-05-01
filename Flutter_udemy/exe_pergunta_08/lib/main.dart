import 'package:exe_pergunta_08/questao.dart';
import 'package:exe_pergunta_08/resposta.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;
  int _valorTotal = 0;

   final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },

    {
      'texto': 'Qual é o seu animal favorito ?',
      'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },

    {
      'texto': 'Qual é o seu instrutor favorito ? ',
      'resposta': ['Maria', 'João', 'Leo', 'Pedro']
    },
  ];



  void _resposnder() {
    if(temPergunta){
      setState(() {
        _index++;
      });
    }
  }
    bool get temPergunta{
      return _index < _perguntas.length; // operadores boleanos retornam valores lógicos
    }
  @override
  Widget build(BuildContext context) {

  List<String> respostas = temPergunta ? _perguntas[_index]['resposta'] as List<String> : [] ;
  List<Widget> widgets = respostas.map((element) => Respostas(texto: element, funcao: _resposnder)).toList();// toList() estamos criando uma lista com os widgets Respostas()






    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(title: const Center(child: Text("Perguntas"))),
            body: temPergunta ? Column(children: [
              Questao(texto: _perguntas[_index]['texto'] as String),
              ...widgets //... pega cada elemento da lista widget e joga um por um na lista Columun([])
            ]
            )
            : Container(
              child:const Center(child: Text('FIM !',style: TextStyle(fontSize: 28),))
            )
            )
            );
  }
}
