import 'dart:math';

import 'package:exe_despesas_pessoais_18/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomeApp());
  }
}

class MyHomeApp extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();

  final List<Transaction> _listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de luz', value: 210.30, date: DateTime.now())
  ];
  MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
          Column(
            children: _listaTransaction.map((trs) {
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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
            }).toList(),
          ),
          Card(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: 'Valor'),
              ),
              TextField(
                controller: value,
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print(title.text);
                      print(value.text);
                    },
                    child: const Text(
                      'Nova Transação',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              )
            ]),
          ))
        ],
      ),
    );
  }
}
