import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() {
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final titulo = TextEditingController();
  final valor = TextEditingController();

  _submit() {
    final title = titulo.text;
    final value = double.tryParse(valor.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value); // widget aponta para uma instância da classe Stateful
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titulo,
              onSubmitted: (_) => _submit(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valor,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submit(),
              decoration: const InputDecoration(labelText: 'R\$ (Valor)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _submit();
                  },
                  child: const Text('Nova transação'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
