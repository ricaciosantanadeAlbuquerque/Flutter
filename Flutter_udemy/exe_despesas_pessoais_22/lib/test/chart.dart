import 'package:exe_despesas_pessoais_22/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> lista;

  const Chart({super.key, required this.lista});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totlaSum = 0.0;

      for (var i = 0; i < lista.length; i++) {
        bool sameDay = lista[i].date.day == weekDay.day;
        bool sameMonth = lista[i].date.month == weekDay.month;
        bool sameYear = lista[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += lista[i].value;
        }
      }
      print(DateFormat.E().format(weekDay)[0]);
      print(totlaSum);
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum}; // return
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(elevation: 6, margin: const EdgeInsets.all(20), child: Row(children: []));
  }
}
