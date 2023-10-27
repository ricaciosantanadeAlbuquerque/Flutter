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
        print(DateFormat.E().format(weekDay)[0]);
        print(totalSum);
        return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
      },
    ).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return const Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: []),
    );
  }
}
