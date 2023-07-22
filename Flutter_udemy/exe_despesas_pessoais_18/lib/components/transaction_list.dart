import 'package:exe_despesas_pessoais_18/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> lista;

  const TransactionList({super.key, required this.lista});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: lista.isEmpty ? Column(
        children:[
          const SizedBox(height:15),
          Text('Nenhuma Transação foi cadastrada !',
          style:Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height:15),
          Container(
            height:200,
            child:Image.asset('assets/image/waiting.png',
            fit:BoxFit.cover)
          )
        ]
      )   :ListView.builder(
          itemCount: lista.length,
          itemBuilder: (_, index) {
            final trs = lista[index];
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple),
                    ),
                    child: Text(
                      'R\$ ${trs.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trs.title,
                        style:Theme.of(context).textTheme.titleLarge
                      ),
                      Text(
                        DateFormat('d MMM y').format(trs.date),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
