import 'dart:math';

import 'package:flutter/material.dart';

import 'components/transaction.form.dart';
import 'components/transaction_lits.dart';
import 'models/transaction.dart';

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
  HyHomeAppState createState() => HyHomeAppState();
}

class HyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Novo Tênis de corrida',
      value: 310.10,
      date: DateTime.now(),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de Luz',
      value: 310.10,
      date: DateTime.now(),
    )
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmitted: addTransaction,
          ); // comunicação indireta
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () {
              openTransactionFormModal(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico'),
            ),

            TransactionList(
              listaTransaction: listaTransaction,
            ), // comunicação direta.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openTransactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
