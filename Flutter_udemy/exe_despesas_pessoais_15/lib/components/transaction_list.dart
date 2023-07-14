import 'package:exe_despesas_pessoais_15/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> lista;

  const TransactionList({super.key, required this.lista});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 580,
        child: lista.isEmpty ? Column(
          children: [
              const SizedBox(
                height: 25,
              ),
            Text('Nenhuma Transação Cadastra! ',
            style:Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 25,),
            Container(
              height:200,
              child: Image.asset('assets/image/waiting.png',
              fit:BoxFit.cover),
            )
          ]
        )

        :ListView.builder(
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
                      color:Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                  style:TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight:FontWeight.bold
                  ),)
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Text(trs.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                    Text(
                    DateFormat('d MMM y').format(trs.date),
                    style: const TextStyle(
                      color:Colors.grey
                    )
                    ),
                  ]
                ),
              ]),);
            }),
            );
  }
}
