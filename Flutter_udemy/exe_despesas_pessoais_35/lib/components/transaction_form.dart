import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

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
    final valor = double.parse(value.text);

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo, valor, selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: title,
              onSubmitted: (_) => submitted(),
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: value,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitted(),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              children: [
                Expanded(child: Text('Data Selecionada ${DateFormat('dd MMM y').format(selectedDate)}')),
                TextButton(
                  onPressed: () {
                    _showDatePicker();
                  },
                  child: const Text('Selecionar Data'),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                onPressed: submitted,
                child: const Text('Nova Transalçao'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
