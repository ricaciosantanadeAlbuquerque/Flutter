import 'package:exe_despesas_pessoais_13/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeApp()
    );
  }
}

class MyHomeApp extends StatelessWidget {
  final List<Transaction> _listaTransaction = [
    Transaction(id: 't1', title: 'Novo Tênis de corrida', value: 310.76, date:  DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];
  MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Despesas Pessoais'),
      ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          const Card(
            elevation:5,
            color:Colors.blue,
            child: Text('Gráfico')
          ),
          Column(
            children: _listaTransaction.map((trs){
              return Card(
                child:Row(
                  children:[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal:15,
                        vertical:10
                      ),
                      decoration: BoxDecoration(
                        border:Border.all(
                          width:2,
                          color:Colors.purple,
                        )
                      ),
                      child:Text('R\$ ${trs.value.toStringAsFixed(2)}',
                      style:const TextStyle(
                        fontSize:16,
                        color:Colors.purple,
                        fontWeight:FontWeight.bold,
                      ),
                      )
                    ),
                    Column(
                      children:[
                        Text(trs.title),
                        Text(trs.date.toString())
                      ]
                    )
                  ]
                )
              );
            }).toList()
          ),
          Card(),
        ],
      ),
    );
  }
}
