import 'package:exe_despesas_pessoais_22/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> lista;

  const Chart({super.key, required this.lista});

  List<Map<String, Object>> get groupedTransaction {
    // funcao generate gera a lista de acordo com os parametos passados
    return List.generate(7, (index) {
      /**
         * DateTime.now() == Data de Hoje.
         * subtract() == subtraindo
         *  Duration(days: index) == duração de dias 
         */
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < lista.length; i++) {
        bool sameDay = lista[i].date.day == weekDay.day;
        bool sameMonth = lista[i].date.month == weekDay.month;
        bool sameYear = lista[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += lista[i].value;
        }
      }

      //DateFormat.E() retorna as sigla dos dias da semana, neste caso indicamos o objeto "weekDay" que já possui seus valores subtraidos, como o retorno é uma String, e toda String é uma array. Queremos só a primeira letra do array [0]
      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum}; // a funcao generetor (index){} retorna os elementos da lista
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
        ));
  }
}
