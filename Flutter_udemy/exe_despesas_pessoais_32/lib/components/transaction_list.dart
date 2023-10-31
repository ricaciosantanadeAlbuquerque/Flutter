import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key,required this.listaTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:380,
      child: ListView.builder(
        itemCount: listaTransaction.length,
        itemBuilder:(_,index){
          final trs = listaTransaction[index];
          return Card(
            elevation:5,
            child: ListTile(
              leading: CircleAvatar(
                radius:30,
                backgroundColor:Colors.purple,
                child: Text(trs.value.toStringAsFixed(2),
                ),
              ),
              title: Text(trs.title),
              subtitle: Text( DateFormat('dd MMM y').format(trs.date),
              ),
              trailing: IconButton(onPressed:(){},icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }
      ),
    );
  }
}
