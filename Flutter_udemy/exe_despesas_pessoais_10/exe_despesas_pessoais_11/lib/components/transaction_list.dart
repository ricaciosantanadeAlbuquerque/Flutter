import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> lista;

  const TransactionList({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (__, index) {
            final trs = lista[index];
            return Card(child: Row(
              children:[
                Container(
                  margin:const EdgeInsets.symmetric(
                    vertical:10,
                    horizontal:15
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width:2,
                      color:Colors.purple
                    )
                  ),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                  style:const TextStyle(
                    fontSize:20,
                    fontWeight:FontWeight.bold,
                    color:Colors.purple
                  ),)
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(trs.title,
                    style:const TextStyle(
                      fontSize:16,
                      fontWeight:FontWeight.bold,
                    ),
                    ),
                    Text(DateFormat('d MMM y').format(trs.date),style:const TextStyle(color:Colors.grey))
                  ]
                )
              ]
            ),);
          }),
    );
  }
}
