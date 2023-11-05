import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmmitted;
  
  const TransactionForm({super.key,required this.onSubmmitted});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime _selectedDate = DateTime.now();

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
            TextField(controller: value, decoration: const InputDecoration(labelText: 'Valor (R\$)')),
            SizedBox(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text('Data Selecionada ${DateFormat('dd MMM y').format(_selectedDate)}'),
                ),
                TextButton(onPressed: () {}, child: const Text('Data Selecionada')),
              ]),
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
