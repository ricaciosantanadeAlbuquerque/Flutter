import 'package:flutter/material.dart';
import 'dart:math';
import 'model/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: const MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [Transaction(id: Random().nextDouble().toString(), title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now())];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais')),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 5,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
