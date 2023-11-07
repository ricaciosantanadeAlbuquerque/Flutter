import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;
  const TransactionForm({super.key, required this.onSubmitted});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitted() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }
    widget.onSubmitted(titulo, valor);
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
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: value,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(child: Text('Data Selecionada ${DateFormat('dd MMM y').format(_selectedDate)}')),
                  TextButton(onPressed: () {}, child: const Text('Selecionar Data')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}