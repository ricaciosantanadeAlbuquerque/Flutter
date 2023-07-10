import 'package:exe_despesas_pessoais_13/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;

  const TransactionList({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:330,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder:(_,index){
          var trs = list[index];
          return Card(
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 3,
                    color: Colors.purple,
                  )),
                  child: Text(
                    'R\$ ${trs.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trs.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('d MMM y').format(trs.date),
                  ),
                ],
              ),
            ],
          ),
        );
        }
      ),
    );
  }
}
