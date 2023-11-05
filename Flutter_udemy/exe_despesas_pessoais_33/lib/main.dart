import 'dart:math';

import 'package:exe_despesas_pessoais_33/model/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
          SizedBox(
            height:380,
            child: ListView.builder(
                itemCount: listTransaction.length,
                itemBuilder: (_,index) {
                  final trs = listTransaction[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical:8,
                      horizontal:5,
                    ),
                    elevation:5,
                    child:ListTile(
                      leading: CircleAvatar(
                        radius:30,
                         backgroundColor:Theme.of(context).colorScheme.primary,
                         child: Padding(
                          padding: const EdgeInsets.all(6),
                          
                          child: FittedBox(
                            child: Text('R\$ ${trs.value.toStringAsFixed(2)}'),
                            ),
                          ),
                      ),
                      title: Text(trs.title),
                      subtitle: Text(trs.date.toString()),
                      trailing:  IconButton(
                        color: Theme.of(context).colorScheme.error,
                        onPressed:(){},
                        icon:const Icon(Icons.delete)
                        ,)
                    ),
                  );
                }),
          ),
          Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Formulário'),
          ),
        ],
      ),
    );
  }
}
