import 'dart:math';
import 'package:exe_despesas_pessoais_21/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
      colorScheme:ThemeData().colorScheme.copyWith(
        primary:Colors.purple,
        secondary:Colors.amberAccent,
      ),
      textTheme:ThemeData().textTheme.copyWith(
        titleLarge:const TextStyle(
          fontSize:20,
          color:Colors.black,
          fontWeight:FontWeight.bold,
          fontFamily: 'OpenSans'
        )
      ),

      appBarTheme:const AppBarTheme(
        titleTextStyle: TextStyle(
           fontSize:25,
           fontWeight:FontWeight.bold,
           fontFamily: 'Quicksand'
        )
      )
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _listaTransaction = [
   
  ];

  void addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop(); // fechando o modal !!
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransactionForm(
        onSubmitted: addTransaction,
      ), // passagem de dados  indireta !!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Card(
            color: Colors.blue,
            elevation: 5,
            child: Text('Gráfico'),
          ),
          TransactionList(listaTransaction: _listaTransaction) // passagem dirata
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => openTransactionFormModal(context), child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
