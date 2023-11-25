import 'dart:math';
import 'package:exe_despesas_pessoais_36/models/transaction.dart';
import 'package:flutter/material.dart';

import 'componentes/transaction_form.dart';
import 'componentes/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 255520.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Despesas Pessoais'),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
        TransactionForm(),
         TransactionList(listTransaction: _listTransaction,),
          
        ],
      ),
    );
  }
}
