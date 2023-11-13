import 'package:exe_despesas_pessoais_35/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactioList extends StatelessWidget {
  final List<Transaction> listTransaction;
  final void Function(String) onSubmitted;

  const TransactioList({super.key, required this.listTransaction, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: ListView.builder(
          itemCount: listTransaction.length,
          itemBuilder: (_, index) {
            return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor:Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text(
                        listTransaction[index].value.toStringAsFixed(2),
                      ),
                    ),
                  ),
                ),
                title: Text(listTransaction[index].title),
                subtitle: Text(DateFormat('dd MMM y').format(listTransaction[index].date)),
                trailing: IconButton(
                  onPressed: () {
                    onSubmitted(listTransaction[index].id);
                  },
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                ));
          }),
    );
  }
}
