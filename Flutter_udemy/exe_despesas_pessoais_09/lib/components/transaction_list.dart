import 'package:exe_despesas_pessoais_09/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> lista;

  const TransactionList({super.key,required this.lista});

  @override
  Widget build(BuildContext context){
    return  Container(
      height:400,
      child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context,index){
               var trs = lista[index]; // objeto da lista
                return Card(
                  child:Row(
                    children:[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal:15,
                          vertical:10
                        ),
                        padding:const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border:Border.all(
                            width:2,
                            color:Colors.purple
                          )
                        ),
                        child:Text(' R\$ ${trs.value.toStringAsFixed(2)}',
                        style:const TextStyle(
                            fontSize:20,
                            fontWeight:FontWeight.bold,
                            color:Colors.purple
                        ))
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(trs.title,
                          style:const TextStyle(
                            fontSize:16,
                            fontWeight:FontWeight.bold,
                          )
                          ),
                          Text(DateFormat('d MMM y').format(trs.date),
                          style:const TextStyle(color:Color.fromARGB(255, 132, 131, 131)))
                        ]
                      )
                    ]
                  )
                );
              },)
              );

            
  }
}
