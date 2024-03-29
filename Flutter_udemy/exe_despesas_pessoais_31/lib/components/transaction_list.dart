import 'package:exe_despesas_pessoais_31/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;
  final bool landScape;
  final void Function(String) onRemove;

  const TransactionList({super.key, required this.listTransaction, required this.onRemove,required this.landScape});

  @override
  Widget build(BuildContext context) {
    return listTransaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(children: [
              SizedBox(
                height: landScape ? constraints.maxHeight * 0.10: constraints.maxHeight * 0.05,
              ),
              Text(
                'Nenhuma Transação Cadastrada !!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height:  landScape ?constraints.maxHeight * 0.10 : constraints.maxHeight * 0.05,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.40,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]);
          })
        : ListView.builder(
            itemCount: listTransaction.length,
            itemBuilder: (_, index) {
              final trs = listTransaction[index]; // a cada loop a variável está sendo recriada
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 8,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$ ${trs.value.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                  ),
                  title: Text(
                    trs.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
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
            },
          );
  }
}
