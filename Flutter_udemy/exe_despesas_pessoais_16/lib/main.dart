import 'dart:math';

import 'package:exe_despesas_pessoais_16/models/transaction.dart';
import 'package:flutter/material.dart';


import 'components/transaction_form.dart';

void main() {
  runApp(const ExpensesApp());
}

//==========================================Stateless================================================================================
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
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
              ),
            )),
        home: const MyHomeApp());
  }
}

//===========================================Stateful================================================================================
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

//=========================================State<>===================================================================================
class MyHomeAppState extends State<MyHomeApp> {
  

  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida ', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de luz', value: 211.30, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble.toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _listTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Card(
          elevation: 5,
          color: Colors.blue,
          child: Text('Gráfico'),
        ),
        TransactionForm(onSubmit: _addTransaction),
       
        
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
