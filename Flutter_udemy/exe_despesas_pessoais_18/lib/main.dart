import 'dart:math';
import 'package:exe_despesas_pessoais_18/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transaction.dart';

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
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de luz', value: 210.30, date: DateTime.now())
  ];

  _addTransaction(String titulo, double valor) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titulo, value: valor, date: DateTime.now());

    setState(() {
      _listaTransaction.add(newTransaction);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions:[
          IconButton(onPressed:(){},icon:const Icon(Icons.add),),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
          TransactionForm(onSubmit: _addTransaction,),// comunicação indireta
          TransactionList(lista: _listaTransaction,) // comunicação direta
        ],
      ),
      floatingActionButton:FloatingActionButton(onPressed:(){},child:const Icon(Icons.add),),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
  }
}
