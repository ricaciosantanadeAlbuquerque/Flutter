import 'package:exe_despesas_pessoais_24/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'model/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.purple, secondary: Colors.amberAccent),
        textTheme: ThemeData().textTheme.copyWith(titleLarge: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Quicksand', fontWeight: FontWeight.bold)),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'IBMPlexSans'),
        ),
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
  var totalvalor = 0.0;

  final List<Transaction> listaTransaction = [
    // Transaction(id: Random().nextDouble().toString(), title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
   // Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 3))),
    //Transaction(id: Random().nextDouble().toString(), title: 'Conta Mercadinho', value: 400.30, date: DateTime.now().subtract(const Duration(days: 6))),
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      listaTransaction.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(
            onSubmitted: addTransaction,
          );
        });
  }

  List<Transaction> get recentTransaction {
    return listaTransaction.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  acumulovalor() {
    for (var j in listaTransaction) {
      totalvalor += j.value;
    }
  }

  sumTotalValue(double total) {
    setState(() {
      totalvalor  = total;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Card(
                color: Theme.of(context).colorScheme.secondary,
                child: FittedBox(
                  child: Text(totalvalor.toStringAsFixed(2), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              )),
          IconButton(
            onPressed: () => openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(
              listaTransaction: recentTransaction,
              onSubmitted: sumTotalValue,
            ),
            TransactionList(listTransaction: listaTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => openTransactionFormModal(context), child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
