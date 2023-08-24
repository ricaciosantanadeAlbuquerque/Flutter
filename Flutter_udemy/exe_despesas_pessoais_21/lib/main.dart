import 'dart:math';
import 'package:exe_despesas_pessoais_21/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
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
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now())
  ];

  void addTransaction(String title,double value){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais'),
       actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {}
      ,)
      ,],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
       const  Card(color: Colors.blue, elevation: 5, child: Text('Gráfico'),
       ),
       TransactionForm(onSubmitted: addTransaction,), 
       TransactionList(listaTransaction: _listaTransaction)
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
