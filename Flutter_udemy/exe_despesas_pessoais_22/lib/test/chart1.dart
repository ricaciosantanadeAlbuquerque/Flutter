import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart1 extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const Chart1({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totlaSum = 0.0;

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekday.day;
        bool sameMonth = listaTransaction[i].date.month == weekday.month;
        bool sameYear = listaTransaction[i].date.year == weekday.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += listaTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekday)[0]);
      print(totlaSum);

      return {'day': DateFormat.E().format(weekday)[0], 'value': totlaSum};
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
      ),
    );
  }
}
