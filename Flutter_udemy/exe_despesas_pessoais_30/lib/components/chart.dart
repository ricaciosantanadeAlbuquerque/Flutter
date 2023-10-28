import 'package:exe_despesas_pessoais_30/components/chart_bart.dart';
import 'package:exe_despesas_pessoais_30/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const Chart({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));

        double totalSum = 0.0;

        for (var i = 0; i < listaTransaction.length; i++) {
          bool sameDay = listaTransaction[i].date.day == weekDay.day;
          bool sameMonth = listaTransaction[i].date.month == weekDay.month;
          bool sameYear = listaTransaction[i].date.year == weekDay.year;

          if (sameDay && sameMonth && sameYear) {
            totalSum += listaTransaction[i].value;
          }
        }

        return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
      },
    ).reversed.toList();
  }

  double get weektotlaValue {
    return groupedTransaction.fold(0.0, (ct, map) {
      return ct += map['value'] as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(weektotlaSum as double);
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
              child: ChartBart(label: map['day'] as String, value: (map['value'] as double), perncentage: (weektotlaValue == 0) ? 0 : (map['value'] as double) / weektotlaValue),
            );
          }).toList(),
        ),
      ),
    );
  }
}
