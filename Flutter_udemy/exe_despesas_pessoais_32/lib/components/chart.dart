import 'package:exe_despesas_pessoais_32/components/chart_bart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const Chart({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totlaSum = 0.0;

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekDay.day;

        if (sameDay == true) {
          totlaSum += listaTransaction[i].value;
        }
      }
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    }).reversed.toList();
  }

  double get weekTotlavalue {
    return groupedTransactions.fold(0.0,(cont, map) {
      return cont += (map['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((map) {
          return        
          Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              label: map['day'] as String, 
              value: map['value'] as double,
             percentage: weekTotlavalue == 0 ? 0 : (map['value'] as double) / weekTotlavalue),
          );
        }).toList()),
      ),
    );
  }
}
