import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const TransactionList({super.key,required this.listaTransaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:380,
      child:  listaTransaction.isEmpty ?  
       Column(
        children: [
          const SizedBox(height:20),
          Text('Nenhuma Transação Cadastrada !',
          style:Theme.of(context).textTheme.titleLarge,),
         const SizedBox(
            height:20
          ),
          SizedBox(
            height:280,
            child: Image.asset('assets/image/waiting.png',
            fit: BoxFit.cover
            ),
          ),
        ],
       )
      :ListView.builder(
        itemCount: listaTransaction.length,
        itemBuilder:(_,index){
          final trs = listaTransaction[index];
          return Card(
            elevation:5,
            child: ListTile(
              leading: CircleAvatar(
                radius:30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(trs.value.toStringAsFixed(2),
                ),
              ),
              title: Text(trs.title,
              style: Theme.of(context).textTheme.titleLarge),
              subtitle: Text( DateFormat('dd MMM y').format(trs.date),
              style: const TextStyle(
                color:Colors.grey,
              ),
              ),
              trailing: IconButton(onPressed:(){},icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }
      ),
    );
  }
}
