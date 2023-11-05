import 'dart:math';

import 'package:exe_despesas_pessoais_33/model/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
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
