import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> lista;

  const TransactionList({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (_, index) {
          final trs = lista[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.purple,
                    ),
                  ),
                  child: Text(
                    'R\$ ${trs.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trs.title, style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      DateFormat('d MMM y').format(trs.date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
