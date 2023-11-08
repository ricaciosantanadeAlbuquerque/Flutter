import 'package:exe_despesas_pessoais_34/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const Chart({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totlaSum = 0.0;

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekDay.day;
        bool sameMonth = listaTransaction[i].date.month == weekDay.month;
        bool sameYear = listaTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += listaTransaction[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: groupedTransaction.map((map) {
            return ChartBar(label: map['day'] as String, value: map['value'] as double, percentage: 0.5);
          }).toList(),
        ));
  }
}
