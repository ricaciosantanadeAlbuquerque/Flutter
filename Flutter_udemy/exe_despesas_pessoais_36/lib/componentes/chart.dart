import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

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
          dia = 'S';
          break;
        case 'Tu':
          dia = 'T';
          break;
        case 'We':
          dia = 'Q';
          break;
        case 'Th':
          dia = 'Q';
          break;
        case 'Fr':
          dia = 'S';
          break;
        case 'Sa':
          dia = 'S';
          break;
        case 'Su':
          dia = 'D';
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
        child: Row(
            children: groupedTransaction.map((map) {
          return Text('${map['day']} ${map['value']}');
        }).toList()));
  }
}
