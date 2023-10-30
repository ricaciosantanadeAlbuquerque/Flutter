import 'package:exe_despesas_pessoais_31/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listTransaction;
  const Chart({super.key, required this.listTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totlaSum = 0.0;

      for (var i = 0; i < listTransaction.length; i++) {
        bool sameDay = listTransaction[i].date.day == weekDay.day;
        bool sameMonth = listTransaction[i].date.month == weekDay.month;
        bool sameYear = listTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += listTransaction[i].value;
        }
      }
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    }).reversed.toList();
  }

  double get weekTotlaValue {
    return groupedTransaction.fold(0.0, (ct, map) {
      return ct += map['value'] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction.map((map) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: map['day'] as String,
                  value: map['value'] as double,
                  percentage: weekTotlaValue == 0 ? 0 : (map['value'] as double) /  weekTotlaValue
                ),
              );
            }).toList()),
      ),
    );
  }
}
