import 'package:exe_despesas_pessoais_15/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              var trs = lista[index];
              return Card(child: Row(children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal:15,
                    vertical:10,
                  ),
                  padding:const EdgeInsets.all(12),
                  decoration:BoxDecoration(
                    border: Border.all(
                      width:2,
                      color:Colors.purple,
                    ),
                  ),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                  style:const TextStyle(
                      color: Colors.purple,
                      fontWeight:FontWeight.bold
                  ),)
                ),
                Column(
                  children:[
                    Text(trs.title,
                    style:const TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:16,
                    ),),
                    Text(
                    DateFormat('d MMM y').format(trs.date),
                    ),
                  ]
                ),
              ]),);
            }),
            );
  }
}
