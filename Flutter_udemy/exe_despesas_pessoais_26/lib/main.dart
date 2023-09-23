import 'dart:math';

import 'package:exe_despesas_pessoais_26/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

//===========================StatelessWidget===============================================
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

// ===========================StatefulWidget===================================
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}
// ===============================State================================
class MyHomeAppState extends State<MyHomeApp> {

  final List<Transaction> listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now())
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais'),
      actions:[
        IconButton(onPressed: (){},icon:const Icon(Icons.add))
      ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
        const TransactionForm(),
         TransactionList(listaTransaction: listaTransaction,), // comunicação direta
         
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){},
        child:const Icon(Icons.add)
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
  }
}
