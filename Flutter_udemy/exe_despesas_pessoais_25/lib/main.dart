import 'dart:math';

import 'package:exe_despesas_pessoais_25/model/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> ListTransaction = [
    Transaction(id: Random().nextDouble.toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 210.33, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais'),
        actions:[IconButton(onPressed: (){}, icon: const Icon(Icons.add))]
        ),
        body: const Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
        ],
        ),
        floatingActionButton:FloatingActionButton(onPressed: (){},
        child: const Icon(Icons.add)
        ,),
        floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat
        ,);
  }
}
