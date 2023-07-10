

import 'package:flutter/material.dart';

import 'components/transaction_user.dart';


void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomeApp());
  }
}

class MyHomeApp extends StatelessWidget {

  MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
             Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')),
            TransactionUser()
            
          ],
        ),
      ),
    );
  }
}
