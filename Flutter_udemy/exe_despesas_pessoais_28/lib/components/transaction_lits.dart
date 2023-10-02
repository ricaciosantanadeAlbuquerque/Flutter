import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;
  const TransactionList({super.key, required this.listaTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560,
      child: ListView.builder(
          itemCount: listaTransaction.length,
          itemBuilder: (_, index) {
            final trs = listaTransaction[index];
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: const EdgeInsets.all(10),
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
                        color:Colors.purple,
                        
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                    Text(trs.title,
                    style: const TextStyle(
                      fontSize:16,
                      fontWeight:FontWeight.bold,
                    ),
                    ),
                    Text(DateFormat('d MMM y').format(trs.date),
                    style:const TextStyle(color:Colors.grey)
                    ),
                  ]),
                ],
              ),
            );
          }),
    );
  }
}
