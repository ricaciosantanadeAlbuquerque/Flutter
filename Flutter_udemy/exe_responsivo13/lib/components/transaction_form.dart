import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});

  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void submited() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo, valor, selectedDate);
  }

  void calendar() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        selectedDate = date;
      });

      // print("Selecionado");
    });

    // print('Feito');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top:10,
            left:10,
            right:10,
            bottom:10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: title,
                onSubmitted: (_) => submited(),
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                controller: value,
                onSubmitted: (_) => submited(),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(child: Text('Data Selecionada ${DateFormat('dd / MM / y').format(selectedDate)}')),
                    TextButton(
                      onPressed: calendar,
                      child: const Text('Data Selecionada'),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                AdaptativeButton(
                  onPressed: submited,
                  label: 'Nova Transação'
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
