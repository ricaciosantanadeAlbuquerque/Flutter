import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;

  const TransactionList({super.key, required this.listTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: listTransaction.isEmpty
          ? Column(children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Nenhuma Transação Cadastrada !',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 280,
                child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemCount: listTransaction.length,
              itemBuilder: (_, index) {
                final trs = listTransaction[index];
                return Card(
                  elevation:5,
                  margin: const EdgeInsets.symmetric(vertical:8,horizontal:5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(child: Text('R\$ ${trs.value.toStringAsFixed(2)}'),
                        ),
                        ),
                    ),
                    title:  Text(trs.title, 
                    style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(trs.date),
                    ),
                    trailing: IconButton(
                      color: Theme.of(context).colorScheme.error,
                      onPressed:(){},
                      icon:const Icon(Icons.delete),
                      ),
                  ),
                );
              },
            ),
    );
  }
}
