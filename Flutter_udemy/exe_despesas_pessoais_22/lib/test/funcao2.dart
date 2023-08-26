import 'dart:math';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'chart3.dart';

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
  MyHomeAppState createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> lista = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de Luz',
      value: 210.30,
      date: DateTime.now().subtract(
        const Duration(days: 3),
      ),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'pendriver 1TB',
      value: 120,
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

  List<Transaction> get recentTransaction {
    return lista.where((trs) {
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
          title: const Text('Teste 3'),
        ),
        body: Chart3(lista: recentTransaction),
        );
  }
}
