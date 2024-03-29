import 'package:exe_despesas_pessoais_20/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;

  const TransactionList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: list.isEmpty ? 
       Column(
        children:[
           const SizedBox(height:15,),
          Text('Nenhuma Transação cadastrada',
          style:Theme.of(context).textTheme.titleLarge),
          const SizedBox(height:15,),
          SizedBox(
            height:200,
            child: Image.asset('assets/image/waiting.png',fit: BoxFit.cover,)
          ),
        ],
       )
      
      :ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final trs = list[index];
          return Card(
            child:Row(
              children:[
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical:10,
                    horizontal:15
                  ),
                  padding:const EdgeInsets.all(12),
                  decoration:BoxDecoration(
                    border:Border.all(
                      width:2,
                      color:Colors.purple,
                    ),
                  ),
                  child: Text('R\$ ${trs.valeu.toStringAsFixed(2)}',
                  style:const TextStyle(
                    color:Colors.purple,
                    fontSize:20,
                    fontWeight:FontWeight.bold,
                  ),
                  ),
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Text(trs.title,
                    style:Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(DateFormat('d MMM y').format(trs.date),
                    style: const TextStyle(
                      color:Colors.grey,
                    ),),
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
