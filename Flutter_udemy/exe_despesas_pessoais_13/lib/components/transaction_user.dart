import 'dart:math';

import 'package:exe_despesas_pessoais_13/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:exe_despesas_pessoais_13/models/transaction.dart';
import 'package:exe_despesas_pessoais_13/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});
  @override
  TransactionUserState createState() => TransactionUserState();
}

class TransactionUserState extends State<TransactionUser> {
  final List<Transaction> _listaTransaction = [
    Transaction(id: 't1', title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];

  addTransaction(String titulo, double valor) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: titulo, value: valor, date: DateTime.now());

    setState(() {
      _listaTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionForme(onSubmit: addTransaction),// comunicação indireta
      TransactionList(list: _listaTransaction), // comunicação direta
    ]);
  }
}
