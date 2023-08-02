import 'dart:math';

import 'package:exe_despesas_pessoais_20/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(

      ),
      home: const MyHomeApp()
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  MyHomeAppState createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
 final List<Transaction> listTransaction = [
  Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de Corrida', valeu: 311.0, date: DateTime.now(),
  )
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Despesas Sociais"),
      ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          const  Card(
            elevation:5,
            color:Colors.blue,
            child:Text('Gráfico')
          ),
           TransactionList(list: listTransaction)
        ]
      )
    );
  }
}
