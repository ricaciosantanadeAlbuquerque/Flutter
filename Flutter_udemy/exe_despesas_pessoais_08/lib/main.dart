import 'package:exe_despesas_pessoais_08/components/transaction_user.dart';
import 'package:flutter/material.dart';


void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeApp());
  }
}

class MyHomeApp extends StatelessWidget {
  
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body:  SingleChildScrollView(child: TransactionUser()) );
  }
}
