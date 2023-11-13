import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

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

  double get weekTotleValue {
    return groupedTransaction.fold(0.0, (ct, map) {
      return ct += map['value'] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: groupedTransaction.map((map) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(label: map['day'] as String, value: map['value'] as double, percentage: weekTotleValue == 0 ? 0.0 : (map['value'] as double) / weekTotleValue));
          }).toList()),
        ));
  }
}
