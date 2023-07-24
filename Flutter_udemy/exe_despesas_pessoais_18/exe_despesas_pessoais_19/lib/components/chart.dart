import 'package:exe_despesas_pessoais_19/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> lista;

  const Chart({super.key, required this.lista});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      ); // a data de hoje menos 7 dias.
      // o Objeto weekDay possuirá a data de sete dias atras

      double totlaSum = 0.0;

      for (var i = 0; i < lista.length; i++) {
        bool samDay = lista[i].date.day == weekDay.day;
        bool samMonth = lista[i].date.month == weekDay.month;
        bool samYear = lista[i].date.year == weekDay.year;

        if (samDay && samMonth && samYear) {
          totlaSum += lista[i].value;
        }
      }
      print(DateFormat.E().format(weekDay)[0]);
      print(totlaSum);
      return {
        'day': DateFormat.E().format(weekDay)[0], // só a letra na posição 0 da string
        'value': totlaSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          ...groupedTransaction.map((map) {
            return Text('${map['day']} ${map['value']}');
          }).toList(),
        ],
      ),
    );
  }
}
