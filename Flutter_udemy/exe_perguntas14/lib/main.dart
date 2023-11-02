import 'package:exe_perguntas14/questao.dart';
import 'package:exe_perguntas14/resposta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() => PerguntaAppState();
}

class PerguntaAppState extends State<PerguntaApp> {
  int _index = 0;

  final List<Map<String, Object>> _lista = const [
    {
      'texto': 'Qual  é a sua cor favorita ?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu Animal favorito ?',
      'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual o seu instrutor favorito ?',
      'resposta': ['Maria', 'joão', 'Leo', 'Pedro']
    }
  ];

  void responder() {
   if(temPerguntaSelecionada){
     setState(() {
        _index++;
      });
   }
  }

  bool get temPerguntaSelecionada {
    return _index < _lista.length; // tamanho 3 (0 1 2)
  }

  @override
  Widget build(BuildContext context) {
    List<String> listaResposta = temPerguntaSelecionada == true ? _lista[_index]['resposta'] as List<String> : [];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Perguntas'),
          ),
        ),
        body: temPerguntaSelecionada?  Column(
          children: [
            Questao(texto: _lista[_index]['texto'] as String),
            ...listaResposta.map((element) {
              return Resposta(texto: element, onSelected: responder);
            }).toList()
          ],
        ) : const SizedBox(
          child: Center(child: Text('Fim da lista !'))
        )
      ),
    );
  }
}
