import 'dart:math';
import 'package:exe_despesas_pessoais_17/components/transaction_list.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';
import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 18,
                fontFamily: 'IBMPlexSans-BoldItalic',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay-Italic-VariableFont_wght',
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
  State<StatefulWidget> createState() {
    return MyHomeAppState();
  }
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _listTransaction = [];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
    
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais'), actions: [
        IconButton(
          onPressed: () {
            _openTransactionFormModal(context);
          },
          icon: const Icon(Icons.add),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              elevation: 5,
              color: Colors.blue,
              child: Text('Gráfico'),
            ),
            TransactionList(lista: _listTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _openTransactionFormModal(context);
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
