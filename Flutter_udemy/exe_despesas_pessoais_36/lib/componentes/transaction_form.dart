import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {

 final _title = TextEditingController();
 final _value = TextEditingController();
 final DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: _title,
            decoration: const InputDecoration(
              labelText: 'Títle',
            ),
          ),
          TextField(controller: _value, decoration: const InputDecoration(labelText: 'Valor (R\$)')),
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
              onPressed: () {},
              child: const Text('Nova transação'),
            ),
          ])
        ]),
      ),
    );
  }
}
