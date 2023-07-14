import 'dart:math';
import 'package:flutter/material.dart';
import 'components/transaction_forme.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
  
    return  MaterialApp(
      theme: ThemeData().copyWith(
       colorScheme: ThemeData().colorScheme.copyWith(
        primary: Colors.purple,
        secondary:Colors.amber,  
       ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight:FontWeight.bold,
            color: Colors.black
          )
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: ' OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold
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
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextDouble.toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble.toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
   
  ];

  _addTransaction(String titulo, double valor) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titulo, value: valor, date: DateTime.now());
    setState(() {
      _listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop(); //7 fecha o modal
  }

  newTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmitted: _addTransaction,
          ); // passagem de dados indireta
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais'), actions: [
          IconButton(
            onPressed: () {
              newTransactionFormModal(context);
            },
            icon: const Icon(Icons.add),
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Gráfico'),
              ),
              TransactionList(
                lista: _listTransaction,
              ), // passagem de dados direta
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            newTransactionFormModal(context);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
