import 'package:exe_despesas_pessoais_22/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart2 extends StatelessWidget {
  final List<Transaction> listaTransaction;
  const Chart2({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totlaSum = 0.0;

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekDay.day;
        bool sameMonth = listaTransaction[i].date.month == weekDay.month;
        bool sameYear = listaTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += listaTransaction[i].value;
        }
      }
      print(DateFormat.E().format(weekDay)[0]);
      print(totlaSum);
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [],
        ));
  }
}
