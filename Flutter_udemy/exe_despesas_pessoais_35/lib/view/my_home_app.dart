import 'dart:math';
import 'package:exe_despesas_pessoais_35/components/chart.dart';
import 'package:exe_despesas_pessoais_35/components/transaction_list.dart';
import 'package:exe_despesas_pessoais_35/models/transaction.dart';
import 'package:flutter/material.dart';

import '../components/transaction_form.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250, date: DateTime.now()),
  ];

  addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => TransactionForm(
              onSubmitted: addTransaction,
            ));
  }

  removeTransactio(String id) {
    setState(() {
      listTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  List<Transaction> get recentTransaction {
    return listTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
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
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.stretch, 
           children: [
            
          Chart(listaTransaction: recentTransaction),
          TransactioList(listTransaction: listTransaction, onSubmitted: removeTransactio),
        ]),
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
