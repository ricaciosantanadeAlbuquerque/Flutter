import 'package:exe_pergunta_07/questao.dart';
import 'package:exe_pergunta_07/resposta.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

//=================================================================================

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

//==================================================================================

class PerguntaAppState extends State<PerguntaApp> {

  int index = 0;

  

  void responder(){
    setState(() {
      index++;
    });
  }
  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita ?',
        'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'texto': 'Qual é o seu animal favorito ?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leao']
      },
      {
        'texto': 'Qual é o seu instrutor favorito ?',
        'resposta': ['Maria', 'João', 'Leo', 'Pedro']
      }
    ];

    List<Widget> respostas = [];

    for (var valor in perguntas[index]['resposta'] as List<String>) { //  
      respostas.add(Resposta(texto: valor, funcao: responder));
    }
    /**
     * perguntas[index]['resposta'] o retorn disto é  ['Preto', 'Vermelho', 'Verde', 'Branco']
     * quando acessamos pergunta na posição[index] ou 0, estamos acessando um Map{} que possui chaves e valores, para acessar os valores em um Map basta referênciar a chave desejada ['resposta'], neste caso retornou uma lista de String. 
     * E é  essa lista de Strings que está cendo percorrida pelo for( in )
     */

    return MaterialApp(
         home:Scaffold(
          appBar:AppBar(
            title:const Center(
              child:Text("Perguntas ! ")
            )
          ),
          body:Column(
            children: [
              Questao(texto: perguntas[index]['texto'] as String ),
              ...respostas
              /**
               * O operador Spred '...' pega cada elemento da lista 'respostas' e joga para dentro da lista Column([]), um por um 
               * de forma ordenada.
               */
            ]
          )
         )
    );
  }
}
