import 'dart:math';

import 'package:exe_despesas_pessoais_11/components/transaction_form.dart';
import 'package:exe_despesas_pessoais_11/components/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextInt(10).toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextInt(10).toString(), title: 'Conta de Luz', value: 210.3, date: DateTime.now())
  ];

  void _addTransaction(String title1, double value1) {
    final newTransaction = Transaction(id: Random().nextInt(10).toString(), title: title1, value: value1, date: DateTime.now());

    setState(() {
      _listTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(color: Colors.blue, elevation: 5, child: Text('Gráfico')),
          TransactionForm(onSubmit: _addTransaction),
          TransactionList(lista: _listTransaction),

        ],
      ),
    );
  }
}
