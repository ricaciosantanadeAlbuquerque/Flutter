import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listTransaction;

  const Chart({super.key, required this.listTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      String dia = '';
      double totlaSum = 0.0;

      for (var i = 0; i < listTransaction.length; i++) {
        bool sameDay = listTransaction[i].date.day == weekDay.day;

        if (sameDay == true) {
          totlaSum += listTransaction[i].value;
        }
      }
      //print(DateFormat.E().format(weekDay)[0] + DateFormat.E().format(weekDay)[1]);
      switch (DateFormat.E().format(weekDay)[0] + DateFormat.E().format(weekDay)[1]) {
        case 'Mo':
          dia = 'Seg';
          break;
        case 'Tu':
          dia = 'Ter';
          break;
        case 'We':
          dia = 'Qua';
          break;
        case 'Th':
          dia = 'Qui';
          break;
        case 'Fr':
          dia = 'Sex';
          break;
        case 'Sa':
          dia = 'Sab';
          break;
        case 'Su':
          dia = 'Dog';
          break;
      }

      return {'day': dia, 'value': totlaSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: groupedTransaction.map((map) {
            return Flexible(
              fit:FlexFit.tight,
              child: ChartBar(label: map['day'] as String,value: map['value'] as double,percentage: 0.5));
          }).toList()),
        ));
  }
}
