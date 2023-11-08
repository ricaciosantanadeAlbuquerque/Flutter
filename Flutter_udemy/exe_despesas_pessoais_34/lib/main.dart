import 'dart:math';

import 'package:exe_despesas_pessoais_34/model/transaction.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: ' EBGaramond'),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'BarlowCondensed'),
        ),
      ),
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
  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tenis de Corrida', value: 350, date: DateTime.now()),
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _removeTrasaction(String id) {
    setState(() {
      _listTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
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

  List<Transaction> get _recentTransaction {
    return _listTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days:7),
      ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Despesas Pessoais'),
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(listaTransaction: _recentTransaction),
            TransactionList(
              listTransaction: _listTransaction,
              onRemove: _removeTrasaction,
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
