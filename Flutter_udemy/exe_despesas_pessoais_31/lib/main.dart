import 'dart:math';

import 'package:exe_despesas_pessoais_31/components/chart.dart';
import 'package:exe_despesas_pessoais_31/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

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
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'BarlowCondensed',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                labelLarge: const TextStyle(
                  color: Colors.white,
                ),
              ),
          appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'EBGaramond'))),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.3, date: DateTime.now()),
  ];

  _addTransaction(String title, double value,DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date:date);

    setState(() {
      _listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmitted: _addTransaction,
          );
        });
  }

  _deleteTransaction(String id) {
    setState(() {
      _listaTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  List<Transaction> get recentTransaction {
    return _listaTransaction.where((map) {
      return map.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(listTransaction: recentTransaction),
            TransactionList(
              listTransaction: _listaTransaction,
              onRemove: _deleteTransaction,
            ),
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
