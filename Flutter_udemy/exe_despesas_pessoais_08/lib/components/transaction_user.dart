import 'package:exe_despesas_pessoais_08/components/transaction_forme.dart';
import 'package:exe_despesas_pessoais_08/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});
  @override
  TransactionUserState createState() => TransactionUserState();
}

class TransactionUserState extends State<TransactionUser> {


  
  final List<Transaction> _lista = [
    Transaction(id: 't1', title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()), 
    Transaction(id: 't2', title: 'Conta', value: 211.3, date: DateTime.now())
    ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')),
      TransactionList(transactionList: _lista),
      TransactionForme(),
    ]);
  }
}
