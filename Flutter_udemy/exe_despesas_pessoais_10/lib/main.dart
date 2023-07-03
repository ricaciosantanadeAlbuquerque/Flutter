import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() {
  return runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  final List<Transaction> _listTransaction = [
    Transaction(id: 't1', title: 'Tênis de corrida!', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 210.3, date: DateTime.now())
  ];
   HomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais')
        ),
        body: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
          const Card(elevation: 5, color: Colors.blue, child: Text('Gráfico'),
          ),
          Column(children: _listTransaction.map((trs){
            return Card(
              child:Row(
                children:[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal:15,
                      vertical:10,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width:2,
                        color: Colors.purple
                      ),
                    ),
                    child: Text("R\$ ${trs.value.toStringAsFixed(2)}",
                    style:const TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                      color:Colors.purple,
                    ),)
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                   Text(trs.title,
                   style:const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize:20
                   ),
                   ),
                   Text(DateFormat('d MMM y').format(trs.date),
                   style:const TextStyle(
                    color:Colors.grey,
                    fontSize:16
                   )
                   ),
                  ]
                  )
                ]
              )
            );
          }).toList(),
          ),
          Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(children: [
                  TextField(
                    controller:title,
                    decoration:const InputDecoration(
                      labelText: 'Título',
                    )
                  ),
                  TextField(
                    controller:value,
                    decoration:const InputDecoration(
                      labelText:'Valor (R\$)'
                    )
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      TextButton(
                      onPressed: () {},
                      child: const Text('Nova Transação', style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    ]
                  )
                ],),
              ),)
        ],),);
  }
}
