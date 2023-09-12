import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;
  const Chart({super.key, required this.listaTransaction});

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

      print(DateFormat.E().format(weekDay)[0]);
      print(totlaSum);
      //DateFormat.E() retorna a sigla dos dias da semana,
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totlaSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return const Card(elevation: 6, margin: EdgeInsets.all(20), child: Row(children: []));
  }
}
