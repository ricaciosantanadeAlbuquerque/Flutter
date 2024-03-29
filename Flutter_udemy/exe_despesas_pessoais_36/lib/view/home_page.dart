import 'dart:math';
import 'package:flutter/material.dart';
import '../componentes/chart.dart';
import '../componentes/transaction_form.dart';
import '../componentes/transaction_list.dart';
import '../models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _listTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 250.33, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 80, date: DateTime.now().subtract(const Duration(days: 6))),
  ];

  void _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      _listTransaction.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: _addTransaction); // comunicação indireta.
        });
  }

  List<Transaction> get _recentTransaction {
    return _listTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _removeTransaction(String id) {
    setState(() {
      _listTransaction.removeWhere((trs) {
        return trs.id == id; // para remover deve ser true
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        IconButton(
            onPressed: () {
              _openTransactionFormModal(context);
            },
            icon: const Icon(Icons.add)),
      ],
    );

    final avaliableHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: avaliableHeight * 0.20,
              child: Chart(listTransaction: _recentTransaction),
              ),
            SizedBox(
              height: avaliableHeight * 0.80,
              child: TransactionList(
                listTransaction: _listTransaction,
                onRemove: _removeTransaction, // comunicação direta
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
