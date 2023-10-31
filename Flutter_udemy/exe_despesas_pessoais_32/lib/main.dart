import 'dart:math';

import 'package:exe_despesas_pessoais_32/model/transaction.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.purple, secondary: Colors.amberAccent),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'BarlowCondensed'),
                labelLarge: const TextStyle(color: Colors.white),
              ),
          appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'EBGaramond'))),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  MyHomeAppSteta createState() => MyHomeAppSteta();
}

class MyHomeAppSteta extends State<MyHomeApp> {
  final List<Transaction> _listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
  ];

  void _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      _listaTransaction.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmitted: _addTransaction,
          ); // comunicação indireta
        });
  }

  void _removeTransaction(String id) {
    setState(() {
      _listaTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  List<Transaction> get _recentTransaction {
    return _listaTransaction.where((trs) {
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
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(listaTransaction: _recentTransaction),
          TransactionList(
            listaTransaction: _listaTransaction,
            onRemove: _removeTransaction,
          ), // comunicação direta
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
