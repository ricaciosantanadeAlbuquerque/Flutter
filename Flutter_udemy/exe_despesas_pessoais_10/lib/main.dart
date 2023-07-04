import 'package:flutter/material.dart';
import 'dart:math';
import 'package:exe_despesas_pessoais_10/components/transaction_forme.dart';
import '../models/transaction.dart';
import 'components/transaction_list.dart';
void main() {
  return runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(home:  HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

    final List<Transaction> _listTransaction = [
    Transaction(id: 't1', title: 'Tênis de corrida!', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 210.3, date: DateTime.now()),
  ];

  void _addTransaction(String title1, double value1) {
    final newTransaction = Transaction(id: Random().nextInt(10 + 1).toString(), title: title1, value: value1, date: DateTime.now());

    setState(() {
      _listTransaction.add(newTransaction);
    });
  }




  _openTransactionFromModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForme(onSubmit: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais'), 
        actions: [
          IconButton(
            onPressed: () => _openTransactionFromModal(context),
            icon: const Icon(Icons.add),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Gráfico'),
              ),
              ListTransaction(lista: _listTransaction),
       
      ]
            
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()=> _openTransactionFromModal(context), child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
