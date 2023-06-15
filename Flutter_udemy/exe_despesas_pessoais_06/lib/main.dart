import 'package:exe_despesas_pessoais_06/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {

  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  MyHomeApp()
    );
  }
}

class MyHomeApp extends StatelessWidget {

final List<Transaction> listaTransaction =  [
 Transaction(id: 't1', title:'Tênis para corrida', value: 310.76, date: DateTime.now()),
 Transaction(id: 't2', title: 'Conta de lUz', value: 233.3, date: DateTime.now())
];
   MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Despesas Pessoais')
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          const Card(
            elevation:5,
            child:Text('Gráfico')
          ),
          Column(
            children: listaTransaction.map((transac){
              return Card(
                elevation:5,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal:15,
                        vertical:10
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        border:Border.all(
                          width:2,
                          color:Colors.purple
                        )
                      ),
                      child:Text(
                        'R\$ ${transac.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize:16,
                          color:Colors.purple
                        )
                      )
                    ),
                    Column(
                      children:[
                        Text(transac.title),
                        Text(transac.date.toString())
                      ]
                    )
                  ]
                )
              );
            }).toList()
          )
        ]
      )
    );
  }
}
