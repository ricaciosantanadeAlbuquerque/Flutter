import 'dart:math';

import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_lits.dart';
import 'models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.deepPurple,
                secondary: Colors.amberAccent,
              ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'IBMPlexSans'),
                labelLarge: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 25 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        home: const MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  HyHomeAppState createState() => HyHomeAppState();
}

class HyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [
    /**
     *  Transaction(
      id: Random().nextDouble().toString(),
      title: 'Novo Tênis de corrida',
      value: 310.10,
      date: DateTime.now(),
    )
     */
  ];
  bool showChart = false;

  addTransaction(String title, double value,DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date:date);

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
          ); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listaTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void removeTrasaction(String id) {
   setState(() {
      listaTransaction.removeWhere((trs) {
        return trs.id == id;
      });
   });
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        if (isLandScape)
          IconButton(
              onPressed: () {
                setState(() {
                  showChart = !showChart;
                });
              },
              icon: Icon(showChart ? Icons.list : Icons.show_chart)),
        IconButton(
          onPressed: () {
            openTransactionFormModal(context);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final altura = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandScape)
              Switch(
                  value: showChart,
                  onChanged: (value) {
                    setState(() {
                      showChart = value;
                    });
                  }),
            if (showChart || !isLandScape)
              SizedBox(
                height: altura * (isLandScape ? 0.8 : 0.20),
                child: Chart(
                  listaTransaction: recentTransaction,
                ),
              ),
            if (!showChart || !isLandScape)
              SizedBox(
                height: altura * 0.80,
                child: TransactionList(
                  listaTransaction: listaTransaction,onRemove: removeTrasaction,
                ),
              ), // comunicação direta.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openTransactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
