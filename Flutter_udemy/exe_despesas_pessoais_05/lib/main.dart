import 'package:exe_despesas_pessoais_05/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomeApp(),
      );
  }
}

class HomeApp extends StatelessWidget {
final List<Transaction> listaTransaction =  [
 Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
 Transaction(id: 't2', title: 'Conta de Luz', value: 211.3, date: DateTime.now())
];
 HomeApp({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Despesas Pessoais')
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          const Card(
            color:Colors.blue,
            elevation:5,
            child:Text('Gráfico')
          ),
          Column(
            children: listaTransaction.map((tr){
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical:10,
                      ),
                      decoration: BoxDecoration(
                        border:Border.all(
                          color: Colors.purple,
                          width:2
                        )
                      ),
                      padding:const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style:const TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize:16,
                          color:Colors.purple,
                        )
                      )
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(tr.title,
                          style:const TextStyle(
                            fontSize:16,
                            fontWeight:FontWeight.bold,
                          )
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: const TextStyle(
                            color:Color.fromARGB(255, 139, 137, 137)
                          )
                          )
                      ]
                    )
                  ]
                ),
              );
            }).toList()
          )
        ]
      )
    );
  }
}
