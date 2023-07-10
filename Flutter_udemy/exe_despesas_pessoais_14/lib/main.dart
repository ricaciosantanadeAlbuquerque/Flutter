import 'dart:math';

import 'package:exe_despesas_pessoais_14/components/transaction_form.dart';
import 'package:exe_despesas_pessoais_14/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';


void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
 
  final List<Transaction> _litTransaction = [
    Transaction(id: 't1', title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now(),
    ),
    Transaction(id: 't2', title: 'Conta de luz ', value: 211.30, date: DateTime.now(),
    ),
  ];

  addTransaction(String titlo,double valor){
   final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titlo, value: valor, date: DateTime.now());

   setState(() {
     _litTransaction.add(newTransaction);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Despesas Pessoais'),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children:[
            const Card(
              elevation:5,
              color:Colors.blue,
              child: Text('Gráfico')
            ),
          TransactionForm(onSubmit: addTransaction,),
          TransactionList(lista: _litTransaction)
          
          ],
          
        ),
      ),
    );
  }
}
