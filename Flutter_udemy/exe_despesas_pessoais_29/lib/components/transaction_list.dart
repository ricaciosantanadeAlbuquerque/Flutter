import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;
  final void Function(String id) onRemove;

  const TransactionList({super.key, required this.listaTransaction, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return listaTransaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height:constraints.maxHeight * 0.05),
                Text('Nenhuma Transação Cadastrada !', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
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
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$ ${trs.value.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      trs.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(trs.date),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          onRemove(trs.id);
                        },
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error)),
              );
            },
          );
  }
}
