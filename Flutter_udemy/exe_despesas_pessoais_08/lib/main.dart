import 'package:exe_despesas_pessoais_08/models/transaction.dart';
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
  final titulo = TextEditingController();
  final value = TextEditingController();

  final List<Transaction> _lista = [Transaction(id: 't1', title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()), Transaction(id: 't2', title: 'Conta', value: 211.3, date: DateTime.now())];
  MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Card(elevation: 5, color: Colors.blue, child: Text('Gráfico')),
          Column(
              children: _lista.map((trs) {
            return Card(
                child: Row(children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.purple)),
                  padding: const EdgeInsets.all(10),
                  child: Text('R\$ ${trs.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Text(trs.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  DateFormat('d MMM y').format(trs.date),
                  style: const TextStyle(color: Colors.grey),
                )
              ])
            ]));
          }).toList()),
          Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  TextField(controller: titulo, decoration: const InputDecoration(labelText: 'Título')),
                  TextField(controller: value, decoration: const InputDecoration(labelText: 'Valor (R\$)')),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        child: const Text('Nova Transferência', style: TextStyle(color: Colors.purple)),
                        onPressed: () {
                          print(titulo.text);
                          print(value.text);
                        })
                  ])
                ]),
              ))
        ]));
  }
}
