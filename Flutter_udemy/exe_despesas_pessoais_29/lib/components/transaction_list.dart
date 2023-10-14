import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key, required this.listaTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: listaTransaction.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 10),
                Text('Nenhuma Transação Cadastrada !', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 280,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: listaTransaction.length,
              itemBuilder: (_, index) {
                final trs = listaTransaction[index];
                return Card(
                  elevation:5,
                  margin: const EdgeInsets.symmetric(vertical: 8,horizontal:6),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius:30,
                      backgroundColor:Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$ ${trs.value.toStringAsFixed(2)}'),
                          ),
                      ),
                    ),
                    title: Text(trs.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(trs.date),),
                  ),
                );
              },
            ),
    );
  }
}
