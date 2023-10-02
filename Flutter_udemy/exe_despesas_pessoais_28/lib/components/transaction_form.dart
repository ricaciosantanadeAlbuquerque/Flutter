import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});

  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();

  submitted() {
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
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: title,
              onSubmitted: (_) => submitted(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: value,
              onSubmitted: (_) => submitted(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Container(
              height:70,
              child: Row(
                children: [
                  Text('Nenhuma Data selecionada !',
                  style: Theme.of(context).textTheme.titleLarge),
                  TextButton(onPressed: (){},child: const Text('Selecionar Data'),)
                ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                                   onPressed: () {
                    submitted();
                  },
                  child:  Text(
                    'Nova Transação',
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
