import 'package:exe_despesas_pessoais_27/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key, required this.listaTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 380,
        child: listaTransaction.isEmpty? Column(
          children:[
            const SizedBox(height:15),
            Text('Nenhuma transação Cadastrada',
            style:Theme.of(context).textTheme.titleLarge
            ),
            const SizedBox(height:15),
            Container(
              height:280,
               child: Image.asset('assets/image/waiting.png',
               fit: BoxFit.cover,
               ),
            ),
          
          ],
        ):ListView.builder(
            itemCount: listaTransaction.length,
            itemBuilder: (_, index) {
              final trs = listaTransaction[index];
              return Card(
                  child: Row(children: [
                Container(
                  margin:const EdgeInsets.symmetric(
                    vertical:10,
                    horizontal:15,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration:BoxDecoration(
                    border:Border.all(
                      width:2,
                      color:Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize:20,
                    color:Theme.of(context).colorScheme.primary,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Text(trs.title,
                  style: Theme.of(context).textTheme.titleLarge
                  ,),
                  Text(DateFormat('d MMM y').format(trs.date)),
                ],
                ),
              ]
              ,)
              ,);
            },
            ),);
  }
}
