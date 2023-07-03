import 'dart:math';

import 'package:flutter/material.dart';
import 'package:exe_despesas_pessoais_10/components/transaction_forme.dart';
import 'package:exe_despesas_pessoais_10/components/transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});
  @override
  State<TransactionUser> createState() {
    return TransactionUserState();
  }
}

class TransactionUserState extends State<TransactionUser> {
  
    final List<Transaction> _listTransaction = [
      Transaction(id: 't1', title: 'Tênis de corrida!', value: 310.76, date: DateTime.now()), 
      Transaction(id: 't2', title: 'Conta de Luz', value: 210.3, date: DateTime.now()),
      
      ];

  void _addTransaction(String title1, double value1){
    final newTransaction = Transaction(id: Random().nextInt(10+1).toString(), title: title1, value: value1, date: DateTime.now());

    setState(() {
      _listTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
         TransactionForme(onSubmit: _addTransaction),
         ListTransaction(lista: _listTransaction),
      ]
    );
  }
}
