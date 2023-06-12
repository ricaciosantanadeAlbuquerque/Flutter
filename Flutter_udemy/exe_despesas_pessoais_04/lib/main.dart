import 'package:exe_despesas_pessoais_04/models/transaction.dart';
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
    Transaction(id: 't1', title: 'Novo Tênis de Corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now()),
  ];
  MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Card(
            color: Colors.blue,
            elevation: 5,
            child: Text('Gráfico'),
          ),
          Column(
              children: _listaTransaction.map((obT) {
            return Card(
              child: Row(
                children:[
                  Container(
                    margin:const EdgeInsets.symmetric(
                      horizontal:15,
                      vertical:10,
                      ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2
                      )
                    ),
                    padding:const EdgeInsets.all(10),
                    child:Text(
                      'R\$ ${obT.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:20,
                          color:Colors.purple,
                        ),
                      ),
                   
                  ),
                  Column(
                    children:[
                      Text(obT.title),
                      Text(obT.date.toString()),
                    ]
                  )
                ]
              )
                );
          }).toList() // pega cada elemento da lista e retorna uma lista de widget
              ),
        
        ],
        ),
        );
  }
}
