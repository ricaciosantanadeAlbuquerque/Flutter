import 'dart:math';
import 'package:intl/intl.dart';
import 'package:exe_despesas_pessoais_36/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final List<Transaction> listTransaction = [
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 255520.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Despesas Pessoais'),
        ),
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
          SizedBox(
              height: 380,
              child: ListView.builder(
                  itemCount: listTransaction.length,
                  itemBuilder: (_, index) {
                    final trs = listTransaction[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical:8,
                        horizontal:5,
                      ),
                      elevation: 5,
                      child: ListTile(
                        leading:CircleAvatar(
                          radius:30,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(
                              child: Text(trs.value.toStringAsFixed(2),
                              style:const TextStyle(
                                fontWeight:FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(trs.title),
                        subtitle:Text(DateFormat('dd MMM y').format(trs.date)),
                        trailing: IconButton(
                          color:Theme.of(context).colorScheme.error,
                          onPressed:(){},icon:const Icon(Icons.delete)),
                      ),
                    );
                  })),
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Form'),
          ),
        ],
      ),
    );
  }
}
