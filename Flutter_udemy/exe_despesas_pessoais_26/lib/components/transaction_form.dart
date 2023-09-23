import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});
  @override
  TransactionFormState createState() => TransactionFormState();
}
// ==============================State===========================================

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();

  submitter() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) { // retorna se os valores não forem válidos
      return;
    }

    widget.onSubmitted(titulo, valor);
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
              onSubmitted:(_) => submitter(),
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              keyboardType:const TextInputType.numberWithOptions(decimal:true),
              onSubmitted: (_) => submitter(),
              controller: value,
              decoration: const InputDecoration(labelText: 'valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: submitter,
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(color: Colors.purple),
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
