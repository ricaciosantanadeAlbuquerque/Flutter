import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;
  final void Function(String) onRemove;

  const TransactionList({super.key, required this.listaTransaction, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: listaTransaction.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Container(
                    height: constraints.maxHeight * 0.20,
                    child: Text('Nenhuma Transação Cadastrada', style: Theme.of(context).textTheme.titleLarge),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  SizedBox(
                    height: constraints.maxHeight * 0.4,
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
                final TRS = listaTransaction[index];
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Text(
                          'R\$ ${TRS.value.toStringAsFixed(2)}',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(TRS.title, style: Theme.of(context).textTheme.titleLarge),
                          Text(
                            DateFormat('d MMM y').format(TRS.date),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.end,
                          children: [
                            IconButton(
                            color: Theme.of(context).colorScheme.error,
                            onPressed: () {
                              onRemove(TRS.id);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          ]
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
