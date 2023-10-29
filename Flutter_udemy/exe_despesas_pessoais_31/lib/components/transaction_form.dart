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

  submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0;

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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: title,
              onSubmitted:(_) => submit(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: value,
              keyboardType: const TextInputType.numberWithOptions(decimal:true),
              onSubmitted:(_) => submit(),
              decoration: const InputDecoration(labelText: 'valor (R\$)'),
            ),
            Container(
              height: 60,
              child: Row(children: [
                const Expanded(child: Text('Data selecionada')),
                TextButton(
                  onPressed: () {},
                  child: const Text('Selecionar Data'),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: submit,
                  child:  Text(
                    'Nova Transação',
                    style: Theme.of(context).textTheme.labelLarge
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
