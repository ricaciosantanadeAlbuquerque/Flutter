import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double,DateTime) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final _title = TextEditingController();
  final _value = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submit() {
    final titulo = _title.text;
    final valor = double.tryParse(_value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo, valor,_selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((datePicker) {
      if (datePicker == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _title,
              onSubmitted: (_) => _submit(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(controller: _value, keyboardType: const TextInputType.numberWithOptions(decimal: true), onSubmitted: (_) => _submit(), decoration: const InputDecoration(labelText: 'Valor (R\$)')),
            Container(
              height: 70,
              child: Row(
                children: [
                   Expanded(child: Text('Data selecionada: ${DateFormat('d/M/y').format(_selectedDate)}')),
                  TextButton(onPressed: _showDatePicker, child: const Text('Selecionar Data')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    'Nova Transaction',
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
