
import 'dart:math';

import 'package:exe_despesas_pessoais_23/components/chart.dart';
import 'package:exe_despesas_pessoais_23/components/transaction_form.dart';
import 'package:exe_despesas_pessoais_23/components/transaction_list.dart';
import 'package:exe_despesas_pessoais_23/transaction/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.purple, secondary: Colors.amberAccent),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Lobster'),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'RussoOne'),
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
  final List<Transaction> _lista = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de luz', value: 250.35, date: DateTime.now().subtract(const Duration(days:3),),),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 120, date: DateTime.now().subtract(const Duration(days:6),),)
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _lista.add(newTransaction);
    });

    Navigator.of(context).pop(); // fechando o modal;
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: _addTransaction); // comunicação indireta
        });
  }

  List<Transaction> get _recentTransaction { // filtrando a lista
    return _lista.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () {
              _openTransactionFormModal(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Chart(listaTransaction: _recentTransaction),

            TransactionList(listaTransaction: _lista), // comunicação direta
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openTransactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
