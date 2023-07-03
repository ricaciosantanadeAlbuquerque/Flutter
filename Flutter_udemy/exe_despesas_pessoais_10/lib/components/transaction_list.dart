import 'package:exe_despesas_pessoais_10/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTransaction extends StatelessWidget {
  final List<Transaction> lista;

  const ListTransaction({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:380,
      child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (_, index) {
            final trs = lista[index];
            return Card(
                child: Row(children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.purple),
                  ),
                  child: Text(
                    "R\$ ${trs.value.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  )),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  trs.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(DateFormat('d MMM y').format(trs.date), style: const TextStyle(color: Colors.grey, fontSize: 16)),
              ])
            ]));
          }),
    );
  }
}
