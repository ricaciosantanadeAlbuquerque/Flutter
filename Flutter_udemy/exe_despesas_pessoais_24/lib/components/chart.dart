import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;
  const Chart({super.key, required this.listaTransaction,});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totlaSum = 0.0;

      // para cada um loop da List.generate(), ocorrerá todos os loops  do laço for()

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekDay.day;
        bool sameMonth = listaTransaction[i].date.month == weekDay.month;
        bool sameYear = listaTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlaSum += listaTransaction[i].value;
        }
      }

      //print(DateFormat.E().format(weekDay)[0]);
      //print(totlaSum);
      //DateFormat.E() retorna a sigla dos dias da semana,
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransaction.fold(0.0, (count, map) {
      return count + (map['value'] as double);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    //groupedTransaction;
    // print(_weekTotalValue);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.isNotEmpty
              ? groupedTransaction.map((map) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(label: map['day'] as String, value: map['value'] as double, percentage: groupedTransaction.isNotEmpty ? (map['value'] as double) / _weekTotalValue : 0.5),
                  );
                }).toList()
              : [],
        ),
      ),
    );
  }
}
