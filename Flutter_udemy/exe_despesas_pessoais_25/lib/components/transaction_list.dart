import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key, required this.listaTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 580,
        child: listaTransaction.isEmpty ? Column(
          children:[
           const SizedBox(
              height:10
            ),
            Text('Nenhuma Transação Cadastrada !',
            style:Theme.of(context).textTheme.titleLarge,
            ),
            const  SizedBox(height: 10),
            SizedBox(
              height: 222,
              child:Image.asset('assets/image/waiting.png',
              fit: BoxFit.cover,
              ),
            )
          ]
        )   :ListView.builder(
          itemCount: listaTransaction.length,
          itemBuilder: (_, index) {
            final trs = listaTransaction[index];
            return Card(
              child:Row(children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical:10,
                    horizontal:15
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    border:Border.all(
                      width: 2,
                      color:Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:20,
                    color:Theme.of(context).colorScheme.primary,
                  ),
                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Text(trs.title.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(DateFormat('d MMM y').format(trs.date),
                    style: const TextStyle(
                      color:Colors.grey
                    ),
                    ),
                  ],
                ),
              ],),
              );
          },
        ));
  }
}
