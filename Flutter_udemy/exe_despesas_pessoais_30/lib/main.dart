import 'dart:math';
import 'package:exe_despesas_pessoais_30/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(),
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
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.3, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar:AppBar(
            title: const Text('Despesas Pessoais'),
          ),
          body:  Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation:5,
                color:Colors.blue,
                child:Text('Gráfico'),
              ),
              TransactionList(listTransaction:_listaTransaction  ,),
              Card(
                elevation:5,
                color: Colors.blue,
                child: Text('Formulário')
              )
            ]
          )
    );  
  }
}
