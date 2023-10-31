import 'dart:math';

import 'package:exe_despesas_pessoais_32/model/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  MyHomeAppSteta createState() => MyHomeAppSteta();
}

class MyHomeAppSteta extends State<MyHomeApp> {

  final List<Transaction> listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')),
          Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Lista'),
          ),
          Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Formulário'),
          ),
        ],
      ),
    );
  }
}
