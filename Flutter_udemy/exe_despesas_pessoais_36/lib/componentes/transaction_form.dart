import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});

  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final _title = TextEditingController();
  final _value = TextEditingController();
  final DateTime _selectedDate = DateTime.now();

  submited() {
    final titulo = _title.text;
    final double valor = double.tryParse(_value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo,valor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: _title,
            onSubmitted:(_) => submited(),
            decoration: const InputDecoration(
              labelText: 'Títle',
            ),
          ),
          TextField(
            controller: _value, 
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted:(_) => submited(),
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)'),
              ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(child: Text('Data Selecionada ${DateFormat('dd MMM y').format(_selectedDate)}')),
                TextButton(
                  onPressed: () {},
                  child: const Text('Selecionar Data !'),
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ElevatedButton(
              onPressed: submited,
              child: const Text('Nova transação'),
            ),
          ])
        ]),
      ),
    );
  }
}
