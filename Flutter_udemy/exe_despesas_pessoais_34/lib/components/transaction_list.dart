import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;
  final void Function(String) onRemove;

  const TransactionList({super.key, required this.listTransaction, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: ListView.builder(
          itemCount: listTransaction.length,
          itemBuilder: (_, index) {
            final trs = listTransaction[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text('R\$ ${trs.value.toStringAsFixed(2)}'),
                  ),
                ),
              ),
              title: Text(trs.title),
              subtitle: Text(
                DateFormat('dd MMM y').format(trs.date),
              ),
              trailing: IconButton(
                onPressed: () {
                  onRemove(trs.id);
                },
                icon: Icon(color: Theme.of(context).colorScheme.error, Icons.delete),
              ),
            );
          }),
    );
  }
}
