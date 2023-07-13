import 'dart:math';

import 'package:flutter/material.dart';

import 'components/transaction_forme.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextDouble.toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble.toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];

  addTransaction(String titulo, double valor) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titulo, value: valor, date: DateTime.now());
    setState(() {
      _listTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions:[]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
            const Card(
              elevation: 5,
              color: Colors.blue,
              child: Text('Gráfico'),
            ),
            TransactionList(
              lista: _listTransaction,
            ), // passagem de dados direta
            TransactionForm(onSubmitted: addTransaction,) // passagem de dados indireta
          ],
        ),
      ),
    );
  }
}
