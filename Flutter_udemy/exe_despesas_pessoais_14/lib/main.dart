import 'dart:math';

import 'package:exe_despesas_pessoais_14/components/transaction_form.dart';
import 'package:exe_despesas_pessoais_14/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.purple
      ),
      home:  const MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _litTransaction = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz ',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];


  addTransaction(String titlo, double valor) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titlo, value: valor, date: DateTime.now());

    setState(() {
      _litTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();

  }


  transactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmit: addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais'), actions: [
        IconButton(
          onPressed: () {
            transactionFormModal(context);
          },
          icon: const Icon(Icons.add),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [const Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')), TransactionList(lista: _litTransaction)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          transactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
