import 'package:flutter/material.dart';
import 'package:revisao_perguntas01/questionario.dart';
import 'package:revisao_perguntas01/resultado.dart';

void main() => runApp(const PerguntasApp());

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});
  @override
  _PerguntasAppState createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _index = 0;
  int _valorTotal = 0;
  final List<Map<String, Object>> _lista = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'resposta': [
        {'texto':'Preto','pontuacao':10},
        {'texto':'Vermelho','pontuacao':5},
        {'texto':'Verde','pontuacao':3},
        {'texto':'Branco','pontuacao':1},
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'resposta': [
        {'texto':'Coelho','pontuacao':10},
        {'texto':'Cobra','pontuacao':5},
        {'texto':'Elefante','pontuacao':3},
        {'texto':'Leão','pontuacao':1},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'resposta': [
        {'texto':'Leo','pontuacao':10},
        {'texto':'Maria','pontuacao':5},
        {'texto':'João','pontuacao':3},
        {'texto':'Pedro','pontuacao':1},
      ]
    },
  ];

  void _resposder(int valor) {
    if(temPergunta == true){
      setState(() {
        _index++;
        _valorTotal += valor;
      });
    }
  }
 bool get temPergunta{
  return _index < _lista.length;
 }

 void _resetar(){
    setState(() {
      _index = 0;
      _valorTotal = 0;
    });
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.red
      ),
      home: Scaffold(
        appBar: AppBar(
          title:const Center(
            child: Text('Perguntas'),
          ),
        ),
        body: temPergunta ? Questionario(funcao: _resposder, lista: _lista, index: _index)
        : Resultado(funcao: _resetar, ponto: _valorTotal)
      ),
    );
  }
}
