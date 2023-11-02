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
  int index = 0;

  final List<Map<String, Object>> lista = [
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
    setState(() {
      index++;
    });
  }

  

  @override
  Widget build(BuildContext context) {
   final List<Widget> listaResposta = [];
    for (var element in lista[index]['resposta'] as List<String>) {
      listaResposta.add(
        SizedBox(
        width:double.infinity,
        child: ElevatedButton(onPressed: responder,
         child: Text(element),
         ),
         ),
         );
    }
    //List<String> listaResposta = lista[index]['resposta'] as List<String>;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(6),
              child: Text(
                lista[index]['texto'] as String,
                style: const TextStyle(
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ...listaResposta,
          ],
        ),
      ),
    );
  }
}
