import 'dart:math';
import 'package:exe_despesas_pessoais_30/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'OpenSans',
                color: Colors.black,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25 * MediaQuery.of(context).textScaleFactor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
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
  final List<Transaction> _listaTransaction = [];
  bool showChart = false;

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      _listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop(); // Widget herdado
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          // comunicação indireta
          return TransactionForm(
            onSubmitted: _addTransaction,
          );
        });
  }

  List<Transaction> get _recentTransaction {
    return _listaTransaction.where((trs) {
      return trs.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _removeTransaction(String id) {
    setState(() {
      _listaTransaction.removeWhere((trs) {
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
              icon: Icon(showChart ? Icons.list : Icons.show_chart),
              onPressed: () {
                setState(() {
                  showChart = !showChart;
                });
              }),
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openTransactionFormModal(context);
            }),
      ],
    );

    final altura = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
         if(isLandScape) Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            const Text('Mostre o Gráfico'),
            Switch(
                value: showChart,
                onChanged: (value) {
                  setState(() {
                    showChart = value;
                  });
                }),
          ]),
          if (showChart || !isLandScape)
            SizedBox(
              height: altura * (isLandScape ? 0.8 : 0.25),
              child: Chart(listaTransaction: _recentTransaction),
            ),
          if (!showChart || !isLandScape)
            SizedBox(
              height: altura * 0.75,
              child: TransactionList(
                // comunicação direta
                listTransaction: _listaTransaction, onRemove: _removeTransaction,
              ),
            ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openTransactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
