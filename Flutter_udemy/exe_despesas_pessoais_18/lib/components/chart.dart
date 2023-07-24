import 'dart:ffi';

import 'package:exe_despesas_pessoais_18/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart({super.key, required this.recentTransaction});

  // get

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      ); // o objeto weekDay tem o atributo date dentro
      /**
       * Para cada um loop da lista Generate() havera um loop total da lista de acordo com seu tamanho 
       * exe: generate() 1 loop  for( List<Transaction>) 10 loop
       */
      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) { //l percorre toda lista
        bool samDay = recentTransaction[i].date.day == weekDay.day; // se o dia for igual
        bool samMonth = recentTransaction[i].date.month == weekDay.month; // não muito relevantes
        bool samYear = recentTransaction[i].date.year == weekDay.year; // não muito relevantes

        if (samDay && samMonth && samYear) {
          totalSum += recentTransaction[i].value; // acumulando valor
        }

      }

     //B print(DateFormat.E().format(weekDay)[0]);
      //print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 6,
      child: Row(
        children: groupedTransaction.map((trs) {
          return Text('${trs['day']}: ${trs['value']}');
        }).toList(),
      ),
    );
  }
}
