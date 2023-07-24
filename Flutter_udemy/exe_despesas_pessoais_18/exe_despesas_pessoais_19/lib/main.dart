import 'dart:math';
import 'package:exe_despesas_pessoais_19/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

//=======================STATELESS===============================================================================
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amber,
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomeApp(),
    );
  }
}

//=========================STATEFUL================================================================================
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  MyHomeAppState createState() => MyHomeAppState();
}

//===========================ESTADO=================================================================================
class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> _lista = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now().subtract(const Duration(days:1)),
    ),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days:8),),),
  ];

  void _addTransaction(String titulo, double valor) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: titulo,
      value: valor,
      date: DateTime.now(),
    );
    //_lista.add(newTransaction);
    //print(_lista);

    setState(() {
      // tudo que muda deve está dentro de um setState()
      _lista.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _addTransaction); // comuniacação indireta
        });
  }

  List<Transaction> get recentTransaction {

    return _lista.where((trs) {
      return trs.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  /**
   * A função where() vai varrer a lista _lista retornando verdadeiro ou falso para cada elemento da lista 
   * os que passarem  no test passaram a fazer parte da nova lista toList(). os que receberem false não passaram a fazer parte desta nova lista.
   */
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
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(lista: recentTransaction), // nova lista filtrada
            TransactionList(
              // comunicação direta
              lista: _lista,
            ),
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
