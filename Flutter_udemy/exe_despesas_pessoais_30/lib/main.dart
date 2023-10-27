import 'dart:math';
import 'package:exe_despesas_pessoais_30/models/transaction.dart';
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
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'OpenSans',
                color: Colors.black,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
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
  final List<Transaction> _listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 450.3, date: DateTime.now().subtract(const Duration(days: 44))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.3, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop(); // Widget herdado
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          // comunicação indireta
          return TransactionForm(
            onSubmitted: _addTransaction,
          );
        });
  }

  List<Transaction> get _recentTransaction {
    return _listaTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7),),);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _openTransactionFormModal(context);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Chart(listaTransaction: _recentTransaction),
          TransactionList(
            // comunicação direta
            listTransaction: _listaTransaction,
          ),
        ]),
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
