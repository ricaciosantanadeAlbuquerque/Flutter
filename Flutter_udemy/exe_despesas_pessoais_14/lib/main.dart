import 'package:exe_despesas_pessoais_14/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            children: _litTransaction.map((trs){
                return Card(
                  child:Row(
                    children:[
                      Container(
                        margin:const EdgeInsets.symmetric(
                          horizontal:15,
                          vertical:10,
                        ),
                        padding:const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width:2,
                            color:Colors.purple
                          ),
                        ),
                        child:Text('R\$ ${trs.value.toStringAsFixed(2)}'
                        ,style:const TextStyle(
                            color:Colors.purple,
                            fontSize: 20,
                            fontWeight:FontWeight.bold,
                        ),),
                      ),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          Text(trs.title,style:const TextStyle(
                            fontSize: 16,
                            fontWeight:FontWeight.bold,
                          ),
                          ),
                          Text(DateFormat('d MMM y').format(trs.date),style: const TextStyle(
                            color:Colors.grey
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
