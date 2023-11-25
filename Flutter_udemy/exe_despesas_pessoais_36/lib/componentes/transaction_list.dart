import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;

  const TransactionList({super.key, required this.listTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 380,
        child: ListView.builder(
            itemCount: listTransaction.length,
            itemBuilder: (_, index) {
              final trs = listTransaction[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          trs.value.toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(trs.title),
                  subtitle: Text(DateFormat('dd MMM y').format(trs.date)),
                  trailing: IconButton(color: Theme.of(context).colorScheme.error, onPressed: () {}, icon: const Icon(Icons.delete)),
                ),
              );
            }));
  }
}
