import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> listaTransaction;

  const Chart({super.key, required this.listaTransaction});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totlasum = 0;

      for (var i = 0; i < listaTransaction.length; i++) {
        bool sameDay = listaTransaction[i].date.day == weekDay.day;
        bool sameMonth = listaTransaction[i].date.month == weekDay.month;
        bool sameYear = listaTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totlasum += listaTransaction[i].value;
        }
      }

      return {'day':DateFormat.E().format(weekDay)[0]  ,'value': totlasum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 6,
        margin:const EdgeInsets.all(20),
        child: Row(
          children: groupedTransaction.map((map){
            return Text('${map['day']}${map['value']}');
          }).toList()
            
          ,
        ));
  }
}
