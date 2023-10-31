import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            TextField(
              controller:title,
              decoration:const InputDecoration(
                labelText:'title',
              ),
            ),
            TextField(
              controller:value,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)'
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
               [
                ElevatedButton(onPressed:(){},
                child: const Text('Nova Transação'),
                ),
              ]
            ),
          ],),
        ),
        );
  }
}
