import 'dart:math';

import 'package:exe_despesas_pessoais_19/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

//=======================STATELESS===============================================================================
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: const MyHomeApp());
  }
}

//=========================STATEFUL================================================================================
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  MyHomeAppState createState() => MyHomeAppState();
}

//===========================ESTADO=================================================================================
class MyHomeAppState extends State<MyHomeApp> {

   final List<Transaction> _lista =[
     Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de Corrida', value: 310.76, date: DateTime.now(),),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
   ];

    void _addTransaction(String titulo,double valor){

    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titulo, value: valor, date: DateTime.now(),
    );

    setState(() {
      _lista.add(newTransaction);
    });

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions:[
          IconButton(onPressed:(){},icon:const Icon(Icons.add),
          ),
          ],
        ),
     body: SingleChildScrollView(
       child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation:5,
            color:Colors.blue,
            child:Text('Gráfico')
          ),
          TransactionForm(onSubmit:_addTransaction),
          TransactionList(lista: _lista,),
          
         ],
         ),
     ),
     floatingActionButton:FloatingActionButton(onPressed:(){},
     child:const Icon(Icons.add),
     ),
     floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
  }
}
