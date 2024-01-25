import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionLits extends StatelessWidget {
  final List<Transaction> listTransaction;
  final void Function(String) onSubmitted;

  const TransactionLits({super.key, required this.listTransaction, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return listTransaction.isEmpty
        ? Column(
            children: [
              const SizedBox(height: 20),
              Text('Nenhuma Transação Cadastrada !', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 280,
                child: Image.asset('assets/image/waiting.png', fit: BoxFit.cover),
              ),
            ],
          )
        : ListView.builder(
            itemCount: listTransaction.length,
            itemBuilder: (_, index) {
              final trs = listTransaction[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: FittedBox(
                        child: Text(
                          trs.value.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                  title: Text(trs.title, style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(DateFormat('dd MMM y').format(trs.date),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      onSubmitted(listTransaction[index].id);
                    },
                    color: Theme.of(context).colorScheme.error,
                    icon: const Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
  }
}
