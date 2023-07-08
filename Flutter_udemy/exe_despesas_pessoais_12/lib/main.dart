import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomemApp()
    );
  }
}

class MyHomemApp extends StatelessWidget {
  const MyHomemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:const Text('Despesas Pessoais'),
        ),
        body:Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
            const Card(
              elevation:5,
              color:Colors.blue,
              child:Text('Gráfico')
            ),
            Column(children:[

            ])
          ]
        )
    );
  }
}
