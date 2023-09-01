import 'package:exe_despesas_pessoais_23/components/chart_bar.dart';
import 'package:exe_despesas_pessoais_23/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;
  const Chart({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totlaSum = 0.0;
      for (var j = 0; j < listaTransaction.length; j++) {
        bool sameDay = listaTransaction[j].date.day == weekDay.day;
        bool sameMonth = listaTransaction[j].date.month == weekDay.month;
        bool sameYear = listaTransaction[j].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += listaTransaction[j].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin:const  EdgeInsets.all(20),
        child: Expanded(
          child: Row(
              children: groupedTransaction.map((map) {
            return ChartBar(label: map['day'] as String, percentage: 0.0, value: map['value'] as double);
          }).toList()
          ,),
        )
        ,);
  }
}
