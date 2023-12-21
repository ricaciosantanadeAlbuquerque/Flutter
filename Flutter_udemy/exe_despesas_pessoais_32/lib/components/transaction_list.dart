import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;
  final void Function(String) onRemove;
  const TransactionList({super.key, required this.listaTransaction, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return listaTransaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                 const SizedBox(height:20),
                Text(
                  'Nenhuma Transação Cadastrada !',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
               const SizedBox(height:20),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/image/waiting.png', fit: BoxFit.cover),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: listaTransaction.length,
            itemBuilder: (_, index) {
              final trs = listaTransaction[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      trs.value.toStringAsFixed(2),
                    ),
                  ),
                  title: Text(trs.title, style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(
                    DateFormat('dd MMM y').format(trs.date),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      onRemove(trs.id);
                    },
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            });
  }
}
