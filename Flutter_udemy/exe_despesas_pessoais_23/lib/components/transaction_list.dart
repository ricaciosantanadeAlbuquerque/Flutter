import 'package:flutter/material.dart';

import '../transaction/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key, required this.listaTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 333,
        child: ListView.builder(
            itemCount: listaTransaction.length,
            itemBuilder: (_, index) {
              final trs = listaTransaction[index];
              return Card(
                  child: Row(children: [
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  padding:const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width:2,
                      color:Colors.purple
                    ),
                  ),
                  child: Text(trs.value.toStringAsFixed(2),),
                ),
                Column(children: [
                  Text(trs.title),
                  Text(trs.date.toString()),
                ],),
              ],),);
            },),);
  }
}
