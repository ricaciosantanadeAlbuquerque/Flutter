import 'dart:math';
import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
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
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
          labelLarge: TextStyle(
            color: Colors.white,
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
  MyHomeAppState createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.10, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.10, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.10, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.10, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.10, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.10, date: DateTime.now()),
  ];

  bool showChart = false;

  addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  openTransactionForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // comunicação indireta;
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

    final appBar = AppBar(title: const Text('Despesas Pessoais'), actions: [
     if(isLandScape) IconButton(
        onPressed: () {
          setState(() {
            showChart = !showChart;
          });
        },
        icon: Icon(showChart ? Icons.list : Icons.show_chart),
      ),
      IconButton(
        onPressed: () {
          openTransactionForm(context);
        },
        icon: const Icon(Icons.add),
      ),
    ]);

    final avaliableHeight = MediaQuery.of(context).size.height;
    -appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandScape)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Mostrar o gráfico'),
                Switch(
                    value: showChart,
                    onChanged: (value) {
                      setState(() {
                        showChart = value;
                      });
                    }),
              ]),
            if (showChart == true || !isLandScape == true)
              SizedBox(
                height: avaliableHeight * (isLandScape ? 0.7 : 0.20),
                child: Chart(
                  listaTransaction: recentTransaction,
                ),
              ),
            if (!showChart == true || !isLandScape == true)
              SizedBox(
                height: avaliableHeight * (isLandScape ? 0.7 : 0.8),
                child: TransactionList(listaTransaction: listaTransaction, onRemove: removeTrasaction),
              ), // comunicação direta // comunicação indireta
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
