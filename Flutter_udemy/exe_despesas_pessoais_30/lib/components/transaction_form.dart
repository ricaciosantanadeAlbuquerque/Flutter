import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmitted;


  const TransactionForm({super.key, required this.onSubmitted});

  @override
  State<TransactionForm> createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  submite() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmitted(titulo, valor, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then(((dateValue) {
      if (dateValue != null) {
        setState(() {
          _selectedDate = dateValue;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: title,
            onSubmitted: (_) => submite(),
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: value,
            onSubmitted: (_) => submite(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          SizedBox(
            height: 60,
            child: Row(children: [
              Expanded(child: Text('Data Selecionada ${DateFormat('dd MMM y').format(_selectedDate)}')),
              TextButton(
                onPressed: _showDatePicker,
                child: const Text('Selecionar Data'),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => submite(),
                child: const Text('Nova Transação'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
