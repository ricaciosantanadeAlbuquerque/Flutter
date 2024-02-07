import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionLits extends StatelessWidget {
  final List<Transaction> listTransaction;
  final void Function(String) onSubmitted;

  const TransactionLits({super.key, required this.listTransaction, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: listTransaction.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.10),
                  Text('Nenhuma Transação Cadastrada !', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/image/waiting.png', fit: BoxFit.cover),
                  ),
                ],
              );
            })
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
                    subtitle: Text(DateFormat('dd MMM y').format(trs.date)),
                    trailing: MediaQuery.of(context).size.width > 480
                        ? TextButton.icon(
                            onPressed: () {
                              onSubmitted(trs.id);
                            },
                            icon: Icon(Icons.delete,
                            color:Theme.of(context).colorScheme.error,
                            ),
                            label: Text('Excluindo',
                            style:TextStyle(
                              color:Theme.of(context).colorScheme.error,
                            ),
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              onSubmitted(listTransaction[index].id);
                            },
                            color: Theme.of(context).colorScheme.error,
                            icon: const Icon(Icons.delete),
                          ),
                  ),
                );
              },
            ),
    );
  }
}
