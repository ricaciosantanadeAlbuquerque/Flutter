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
      child: listTransaction.isEmpty ? 
        Column(
          children:[
            const SizedBox(
                height: 15,
              ),
            Text('Nenhuma Transação Cadastrada !',
            style:Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height:280,
              child: Image.asset('assets/image/waiting.png',
              fit: BoxFit.cover,
              ),
              
            ),
          ]
        )
      
      :
      ListView.builder(
        itemCount: listTransaction.length,
        itemBuilder: (_, index) {
          final trs = listTransaction[index];
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
                    'R\$ ${trs.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    trs.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('d MMM y').format(trs.date),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }
}
