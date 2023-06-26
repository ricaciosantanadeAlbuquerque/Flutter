import 'package:exe_despesas_pessoais_08/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  const TransactionList({super.key, required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactionList.map((trs) {
      return Card(
          child: Row(children: [
        Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.purple)),
            padding: const EdgeInsets.all(10),
            child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(trs.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Text(
            DateFormat('d MMM y').format(trs.date),
            style: const TextStyle(color: Colors.grey),
          )
        ])
      ]));
    }).toList());
  }
}
