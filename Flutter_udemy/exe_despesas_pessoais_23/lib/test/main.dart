import 'dart:math';
import 'package:exe_despesas_pessoais_23/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});
  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> lista = [
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Conta de luz',
      value: 250.35,
      date: DateTime.now().subtract(
        const Duration(days: 3),
      ),
    ),
    Transaction(
      id: Random().nextDouble().toString(),
      title: 'Novo Tênis de corrida',
      value: 120,
      date: DateTime.now().subtract(
        const Duration(days: 6),
      ),
    ),

     Transaction(
      id: Random().nextDouble().toString(),
      title: 'Novo Tênis de corrida',
      value: 1200,
      date: DateTime.now().subtract(
        const Duration(days: 44),
      ),
    ),

  ];

  List<Transaction> get recentTransaction {
    return lista.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body: Chart(
          lista: recentTransaction,
        ));
  }
}

class Chart extends StatelessWidget {
  final List<Transaction> lista;

  const Chart({super.key, required this.lista});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totlaSum = 0.0;

      for (var i = 0; i < lista.length; i++) {
        bool sameDay = lista[i].date.day == weekDay.day;
        //bool sameMonth = lista[i].date.month == weekDay.month;
        //bool sameYear = lista[i].date.year == weekDay.year;

        if (sameDay) {
          totlaSum += lista[i].value;
        }
      }
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    });
  }

  double get weekTotalValue {
    return groupedTransaction.fold(0.0, (sum, map) {
      // acumulando valores
      return sum + (map['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction.map((map) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(label: map['day'] as String, value: map['value'] as double, percentage: (map['value'] as double) / weekTotalValue // menor / maior == fração
                      ));
            }).toList()),
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({super.key, required this.label, required this.value, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(child: Text('R\$ ${value.toStringAsFixed(2)}')),
      const SizedBox(height: 5),
      Container(
        height: 60,
        width: 10,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: const Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          FractionallySizedBox(
            heightFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ]),
      ),
      const SizedBox(height: 5),
      Text(label),
    ]);
  }
}
