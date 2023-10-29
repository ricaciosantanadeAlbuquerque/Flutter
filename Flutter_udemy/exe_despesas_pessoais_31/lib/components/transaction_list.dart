import 'package:exe_despesas_pessoais_31/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;
  const TransactionList({super.key, required this.listTransaction});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 380,
        child: ListView.builder(
          itemCount: listTransaction.length, 
          itemBuilder: (_, index) {
            final trs = listTransaction[index]; // a cada loop a variável está sendo recriada 
            return Card(
              elevation:5,
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                 horizontal:8,
                 ),
              child: ListTile(
                leading: CircleAvatar(
                  radius:30,
                  backgroundColor:Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text(trs.value.toStringAsFixed(2)
                      ),
                    ),
                  ),
                ),
                title: Text(trs.title),
                subtitle: Text(trs.date.toString(),
                ),
                trailing: IconButton(onPressed:(){},icon:const Icon(Icons.delete),
                ),
              ),

            );
          },
        ));
  }
}
