import 'package:exe_despesas_pessoais_11/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: MyHomeApp());
  }
}

class MyHomeApp extends StatelessWidget {
  final List<Transaction> _listTransaction = [
    Transaction(id: 't1', title:'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now())
  ];
   MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Despesas Pessoais")
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
         const Card(
           elevation:5,
           color:Colors.blue,
            child: Text('Gráfico')
          ),
          Column(
            children: _listTransaction.map((trs){
                return Card(
                  child:Row(
                    children:[
                       Container(
                        child: Text(trs.value.toString())
                       ),
                       Column(
                        children:[
                          Text(trs.title),
                          Text(trs.date.toString(),)
                        ]
                       ),
                    ],
                  ),
                );
            }).toList(),
          )
        ],
      ),
    );
  }
}
