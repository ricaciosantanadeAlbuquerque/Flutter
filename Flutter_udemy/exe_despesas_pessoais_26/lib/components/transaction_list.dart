import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key,required this.listaTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: listaTransaction.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 20),
                 Text('Nenhuma Transação Cadastrada',
                style:Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: Image.asset('assets/image/waiting.png',
                  fit: BoxFit.cover,
                  ),
                ),
              ],
            )
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
                          style: TextStyle(color: Theme.of(context).colorScheme.primary
                          , fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TRS.title,
                            style: Theme.of(context).textTheme.titleLarge
                          ),
                          Text(
                            DateFormat('d MMM y').format(TRS.date),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
