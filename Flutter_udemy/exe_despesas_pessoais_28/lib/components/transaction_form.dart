import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  submitted() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo, valor, selectedDate);
  }

  calendar() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((dateSelected) {
      if (dateSelected != null) {
        setState(() {
          selectedDate = dateSelected;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: title,
              onSubmitted: (_) => submitted(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: value,
              onSubmitted: (_) => submitted(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            SizedBox(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text('Data Selecionada ${DateFormat('dd /MMM / y').format(selectedDate)}', style: Theme.of(context).textTheme.titleLarge),
                ),
                TextButton(
                  onPressed: calendar,
                  child: const Text('Selecionar Data'),
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    submitted();
                  },
                  child: Text(
                    'Nova Transação',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
