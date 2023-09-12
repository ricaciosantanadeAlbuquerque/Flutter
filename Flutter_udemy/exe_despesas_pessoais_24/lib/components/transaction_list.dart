import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;

  const TransactionList({super.key, required this.listTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
          itemCount: listTransaction.length,
          itemBuilder: (__, index) {
            final transac = listTransaction[index];
            return Card(
                child: Row(children: [
              Container(
                margin:const EdgeInsets.symmetric(
                  horizontal:15,
                  vertical:10),
                  decoration: BoxDecoration(
                    border:Border.all(
                      width:2,
                      color:Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                child: Text('R\$ ${transac.value.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize:20,
                  fontWeight:FontWeight.bold,
                  color:Theme.of(context).colorScheme.primary
                ),
                ),
              ),
               Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(transac.title,
                style: Theme.of(context).textTheme.titleLarge),
                Text(DateFormat('d MMM y').format(transac.date),
                style: const TextStyle(
                  color:Colors.grey,
                ),
                ),
              ],),
            ],
            ),
            );
          },
          ),
    );
  }
}
