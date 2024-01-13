import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});
  @override
  TransactionFormState createState() => TransactionFormState();
}
// ==============================State===========================================

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime selectedDate = DateTime.now();

  submitter() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      // retorna se os valores não forem válidos
      return;
    }

    widget.onSubmitted(titulo, valor, selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              onSubmitted: (_) => submitter(),
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitter(),
              controller: value,
              decoration: const InputDecoration(labelText: 'valor (R\$)'),
            ),
            Row(children: [
              Expanded(child: Text('Data Selecionada: ${DateFormat('dd / MM / y').format(selectedDate)}')),
              TextButton(
                onPressed: () {
                  _showDatePicker();
                },
                child: const Text('Selecionar Data !'),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: submitter,
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
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
