import 'package:exe_despesas_pessoais_08/components/transaction_list.dart';
import 'package:exe_despesas_pessoais_08/components/transaction_user.dart';
import 'package:exe_despesas_pessoais_08/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body: TransactionUser() );
  }
}
