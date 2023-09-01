import 'dart:math';

import 'package:exe_despesas_pessoais_23/components/transaction_form.dart';
import 'package:exe_despesas_pessoais_23/components/transaction_list.dart';
import 'package:exe_despesas_pessoais_23/transaction/transaction.dart';
import 'package:flutter/material.dart';

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
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _lista = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de luz', value: 250.35, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 120, date: DateTime.now())
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _lista.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add),
        ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          const Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')),
           TransactionForm(onSubmitted:_addTransaction), 
           TransactionList(listaTransaction: _lista),
           ],
           ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
