import 'package:flutter/material.dart';

void main() => runApp(const PerguntasApp());

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});
  @override
  _PerguntasAppState createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _index = 0;
  final List<Map<String, Object>> _lista = const [
    {
      'texto': '',
      'resposta': [
        {},
        {},
        {},
        {},
      ]
    },
    {
      'texto': '',
      'resposta': [
        {},
        {},
        {},
        {},
      ]
    },
    {
      'texto': '',
      'resposta': [
        {},
        {},
        {},
        {},
      ]
    },
  ];

  void _resposder() {
    setState(() {
      _index =  0;
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
      ),
    );
  }
}
