import 'package:exe_despesas_pessoais_21/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key, required this.listaTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:330,
      child: listaTransaction.isEmpty ? Column(
        children:[
         Text('Nenhuma transação cadastrada!',
         style: Theme.of(context).textTheme.titleLarge
         ),
          const SizedBox(height: 15,),
          Container(
            height:280,
            child: Image.asset('assets/image/waiting.png',fit:BoxFit.cover),
          ),
        ]
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: listaTransaction.length,
        itemBuilder: (__, index) {
          var trs = listaTransaction[index];
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
                      border: Border.all(width: 2, color: Colors.purple),
                    ),
                    child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                    style:const TextStyle(
                      fontSize:20,
                      color:Colors.purple,
                      fontWeight:FontWeight.bold,
                    ),
                    ),
                    ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      trs.title,
                      style: Theme.of(context).textTheme.titleLarge
                    ),
                    Text(
                      DateFormat('d MMM y').format(trs.date),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
