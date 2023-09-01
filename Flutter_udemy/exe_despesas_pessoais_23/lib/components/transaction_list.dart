import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../transaction/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key, required this.listaTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 333,
        child: ListView.builder(
            itemCount: listaTransaction.length,
            itemBuilder: (_, index) {
              final trs = listaTransaction[index];
              return Card(
                  child: Row(children: [
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  padding:const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width:2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                  style: TextStyle(
                   color: Theme.of(context).colorScheme.primary,
                   fontSize:16,
                   fontWeight:FontWeight.bold
                  ),
                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Text(trs.title,
                  style: Theme.of(context).textTheme.titleLarge
                  
                  ),
                  Text(DateFormat('d MMM y').format(trs.date),
                  style:const TextStyle(color:Colors.grey),),
                ],),
              ],),);
            },),);
  }
}
