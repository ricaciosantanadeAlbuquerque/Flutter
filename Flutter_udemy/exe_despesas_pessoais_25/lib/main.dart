
import 'dart:math';
import 'package:exe_despesas_pessoais_25/model/transaction.dart';
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
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.amberAccent,
              ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'IBMPlexSans'),
          ),
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> listTransaction = [
    
     
        Transaction(id: Random().nextDouble.toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now().subtract(const Duration(days:4)),),
      Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 210.33, date: DateTime.now().subtract(const Duration(days: 5),),),
       Transaction(
      id: Random().nextDouble().toString(),
      title: 'Bike',
      value: 300,
      date: DateTime.now().subtract(
        const Duration(days: 3),
      ),
    ),
    /** Transaction(
      id: Random().nextDouble().toString(),
      title: 'Casa',
      value: 230000,
      date: DateTime.now().subtract(
        const Duration(days: 20),
      ),
    ), */
    
     
  ];

  addTransacton(title, value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop(); // Widget herdado
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransacton); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listTransaction.where((trs) {
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
            onPressed: () => openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Chart (listaTransaction: recentTransaction),
            TransactionList(listaTransaction:listTransaction) // comunicação dirate
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
