import 'package:exe_despesas_pessoais_24/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'model/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: const MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
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
            const Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')),
            TransactionList(listTransaction: listaTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => openTransactionFormModal(context), child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
