import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key,required this.onSubmitted});

  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: title,
            decoration: const InputDecoration(
              labelText: 'título',
            ),
          ),
          TextField(controller: value, 
          decoration: const InputDecoration(labelText: 'valor (R\$)'),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children:[
               TextButton(
              onPressed: () {},
              child: const Text(
                'Nova Transação',
                style: TextStyle(
                  color: Colors.purple,
                ),
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
