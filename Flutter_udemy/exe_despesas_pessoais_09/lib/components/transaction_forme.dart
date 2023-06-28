import 'package:flutter/material.dart';

class TransactionForme extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForme({super.key, required this.onSubmit});

  _onsubmitForm() {
    final textoEntrada = title.text;
    final valueEntrada = double.tryParse(value.text) ?? 0.0;

    if (textoEntrada.isEmpty || valueEntrada <= 0) {
      return;
    }

    onSubmit(textoEntrada, valueEntrada);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            TextField(
              onSubmitted:(value) => _onsubmitForm(),
              controller: title,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              onSubmitted: (value) => _onsubmitForm(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true), 
              controller: value, decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                TextButton(onPressed: _onsubmitForm, 
               child: const Text("Nova Transação", 
               style: TextStyle(color: Colors.purple),
               ),
               ),
               ],
               ),
          ]),
        ),
        );
  }
}
