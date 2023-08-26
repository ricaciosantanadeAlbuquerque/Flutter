import 'dart:math';

import 'package:exe_despesas_pessoais_22/components/chart.dart';
import 'package:exe_despesas_pessoais_22/models/transaction.dart';
import 'package:flutter/material.dart';

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
              titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'OpenSans'),
            ),
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
  final List<Transaction> lista = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 210.30, date: DateTime.now().subtract(  const Duration(days: 3),),),

    Transaction(
      id: Random().nextDouble().toString(),
      title: 'pendriver 1TB',
      value: 120 ,
      date: DateTime.now().subtract(
       const Duration(days: 33),
      ),
    ),

    Transaction(
      id: Random().nextDouble().toString(),
      title: 'blusa',
      value: 50,
      date: DateTime.now().subtract(
       const Duration(days: 4),
      ),
    ),
  ];

  addTransaction(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      lista.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        // abrindo uma janela
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // passagem indireta de dados
        });
  }

  List<Transaction> get recentTransaction {
    return lista.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
      /**
       * trs.date objeto transactio() evocando seu atribulto date 
       * isAfter() == é depois 
       * DateTime.now().subtract(const Duration(days:7)) == data de hoje menos 7 dias, neste caso hoje menos 7 dias seria o  mesmo dia da semana passada.
       * Então se a data do objeto trs.date  for mais nova do que 7 dias atrás então  este objeto permanecerá na lista. 
       */
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despessas Pessoais'),
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
            Chart(lista: recentTransaction),
            TransactionList(lista: lista) ,// passagem direta de dados
           
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
