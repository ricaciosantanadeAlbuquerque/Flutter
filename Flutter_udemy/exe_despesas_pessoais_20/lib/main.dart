import 'dart:math';

import 'package:exe_despesas_pessoais_20/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_forme.dart';
import 'components/transaction_list.dart';

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
  MyHomeAppState createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listTransaction = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Novo Tênis de Corrida',
      valeu: 311.0,
      date: DateTime.now(),
    )
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, valeu: value, date: DateTime.now());

    setState(() {
      listTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Despesas Sociais"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
            const Card(
              elevation: 5, 
              color: Colors.blue,
               child: Text('Gráfico'),
               ),
               TransactionForm(onSubmitted: addTransaction),
                TransactionList(list: listTransaction),
          ],
          ),
        ),
        );
  }
}
