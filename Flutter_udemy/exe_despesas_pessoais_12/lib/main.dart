import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomemApp()
    );
  }
}

class MyHomemApp extends StatelessWidget {
   String? titulo;
   String? valor;
  final List<Transaction> _listTransaction = [
    Transaction(id: 't1', title: 'Novo Tênis de corrida', value: 310.76, date:DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date:DateTime.now()),
  ];
  
   MyHomemApp({super.key});

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
              child:Text('Gráfico')
            ),
            Column(children: _listTransaction.map((objTrs){
                return Card(
                  child:Row(
                    children:[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal:15,
                          vertical:10
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width:2,
                            color:Colors.purple,
                          ),
                        ),
                        child: Text('R\$ ${objTrs.value.toStringAsFixed(2)}',
                        style:const TextStyle(
                          color:Colors.purple,
                          fontSize:20,
                          fontWeight:FontWeight.bold,
                        ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          Text(objTrs.title,
                          style:const TextStyle(
                            fontSize:16,
                            fontWeight:FontWeight.bold,
                          )
                          ),
                          Text(
                            DateFormat('d MMM y').format(objTrs.date),
                            style:const TextStyle(color: Colors.grey)
                          ),
                        ]
                      )
                    ]
                  ),
                );
            }).toList() 
            ),
            Card(
              child:Padding(
                padding:const EdgeInsets.all(12),
                child: Column(
                  children:[
                    TextField(
                      onChanged:(entradaTitle) => titulo = entradaTitle,
                      decoration:const InputDecoration(
                        labelText:'Título'
                      ),
                    ),
                    TextField(
                      onChanged:(entradaValor) => valor = entradaValor,
                      decoration: const InputDecoration(
                        labelText:'Valor(R\$)'
                      )
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        TextButton(
                           onPressed: () {
                            print(titulo);
                            print(valor);
                           },
                           child: const Text(
                            'Nova transação',
                            style: TextStyle(color: Colors.purple),
                  ),
                ),
                      ]
                    )
                  ]
                ),
              )
            )
          ],
        ),
    );
  }
}
