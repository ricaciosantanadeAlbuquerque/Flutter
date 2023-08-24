import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> lista;

  const TransactionList({super.key,required this.lista});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 330, 
    child: ListView.builder(
      shrinkWrap: true,
      itemCount:lista.length,
      itemBuilder:(_,index){
        return Card(
          child:Row(
            children: [
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding:const EdgeInsets.all(12),
                decoration:BoxDecoration(
                  border: Border.all(
                    width:2,
                    color:Colors.purple,
                  ),
                ),
                child: Text('R\$ ${lista[index].value.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize:20,
                  fontWeight:FontWeight.bold,
                  color:Colors.purple,
                ),)
              ),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text(lista[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                  ),),
                  Text(DateFormat('d MMM y').format(lista[index].date)),
                ],
              ),
            ],
          ),
        );
      }
    ),);
  }
}
