

import 'package:exe_despesas_pessoais_03/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context){
      return  MaterialApp(
          home: MyHomeApp()
      );
  }
}

class MyHomeApp extends StatelessWidget{

  final List<Transaction> lista = [
      Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),//Datetime.now() construtor nomeado
      Transaction(id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now()),  
  ];

 MyHomeApp({super.key});
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar:AppBar(
      title:const Text("Despesas Pessoais")
    ),
    body:Column(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      crossAxisAlignment:CrossAxisAlignment.stretch,
      children: const <Widget>[
          Card(
            color:Colors.blue,
            elevation:5,
            child:Text('Gráfico'),
          
          ),
          Card(
            child:Text('Lista de Transações')
          )
      ]
    )
  );
}
}