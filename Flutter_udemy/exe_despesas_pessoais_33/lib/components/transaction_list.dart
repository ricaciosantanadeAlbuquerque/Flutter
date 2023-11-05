import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;
  final void Function(String) onRemove;

  const TransactionList({super.key, required this.listaTransaction, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: ListView.builder(
          itemCount: listaTransaction.length,
          itemBuilder: (_, index) {
            final trs = listaTransaction[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              elevation: 5,
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$ ${trs.value.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(trs.title),
                  subtitle: Text(DateFormat('dd MMM y').format(trs.date)),
                  trailing: IconButton(
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () {
                      onRemove(trs.id);
                    },
                    icon: const Icon(Icons.delete),
                  )),
            );
          }),
    );
  }
}
