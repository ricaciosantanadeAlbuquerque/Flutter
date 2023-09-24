import 'dart:math';

import 'package:exe_despesas_pessoais_26/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

//===========================StatelessWidget===============================================
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.purple, secondary: Colors.amberAccent),
        textTheme: ThemeData().textTheme.copyWith(titleLarge: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'IBMPlexSans')),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'OpenSans'),
        ),
      ),
      home: const MyHomeApp(),
    );
  }
}

// ===========================StatefulWidget===================================
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

// ===============================State================================
class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [
    //Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now().subtract(const Duration(days:5))),
    //Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now())
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  /**
     * Colocando  função  showModalBottomSheet() dentro de uma função da classe MyHomeAppState() eu a torno a visével em toda a classe, sendo que todos os botões apontaram para o mesmo lugar. Ou seja  'openTransactionFormModal()'
     */
  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listaTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days:7)));
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
                openTransactionFormModal(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Chart(listaTransaction: recentTransaction,),
            TransactionList(listaTransaction: listaTransaction), // comunicação direta
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            openTransactionFormModal(context);
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
