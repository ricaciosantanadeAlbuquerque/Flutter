import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmitted;
  const TransactionForm({super.key, required this.onSubmitted});

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime selectedDate = DateTime.now();

  submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo, valor,selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((date) {
       if(date != null){
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: title,
              onSubmitted: (_) => submit(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: value,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submit(),
              decoration: const InputDecoration(labelText: 'valor (R\$)'),
            ),
            SizedBox(
              height: 60,
              child: Row(children: [
                Expanded(
                  child: Text('Data selecionada: ${DateFormat('d MMM y').format(selectedDate)}', style: Theme.of(context).textTheme.titleLarge),
                ),
                TextButton(
                  onPressed: () {
                    _showDatePicker();
                  },
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: submit,
                  child: Text('Nova Transação', style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
