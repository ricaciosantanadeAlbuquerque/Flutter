import 'dart:math';
import 'package:exe_despesas_pessoais_27/components/chart.dart';
import 'package:exe_despesas_pessoais_27/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'OpenSans'),
              labelLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
        ),
      ),
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
  final List<Transaction> listaTransaction = [
     Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 211.30, date: DateTime.now().subtract(const Duration(days: 22))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 210.33, date: DateTime.now().subtract(const Duration(days:3))),
   
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble.toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  openTransactionForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listaTransaction.where((trs) {
      return trs.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () {
              openTransactionForm(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(listaTransaction: recentTransaction),
      
            TransactionList(
              listaTransaction: listaTransaction,
            ), // comunicação direta
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openTransactionForm(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
