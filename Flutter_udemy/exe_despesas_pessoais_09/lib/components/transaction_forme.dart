import 'package:flutter/material.dart';

class TransactionForme extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  final void Function(String,double) onSubmit;

  TransactionForme({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
            keyboardType:const TextInputType.numberWithOptions(),
            controller: value, 
            decoration: const InputDecoration(labelText: 'Valor (R\$)')),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                  onPressed: () {
                    final textoEntrada = title.text;
                    final valueEntrada = double.tryParse(value.text) ?? 0.0;
                    onSubmit(textoEntrada,valueEntrada);
                  },
                  child: const Text("Nova Transação", style: TextStyle(color: Colors.purple)))
            ])
          ]),
        ));
  }
}
