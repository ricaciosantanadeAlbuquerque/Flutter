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
                const SizedBox(height: 10),
                const Text('Nenhuma Transação Cadastrada'),
                const SizedBox(height: 10),
                Container(
                  height: 250,
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
                            color: Colors.purple,
                          ),
                        ),
                        child: Text(
                          'R\$ ${TRS.value.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TRS.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
