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

  submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    // validando os dados

    if (titulo.isEmpty || valor <= 0) {
      return; // retorna desta linha sem passar os dados para funcao onSubmitted()
    }

    widget.onSubmitted(titulo, valor); // passando os valores para o pai de  TransactionForm
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
              onSubmitted:(_) => submit(), // closures!!! função que tem outra função
              decoration: const InputDecoration(
                labelText: 'título',
              ),
            ),
            TextField(
              controller: value,
              keyboardType:const TextInputType.numberWithOptions(decimal: true),
              onSubmitted:(_) => submit(),
              decoration: const InputDecoration(labelText: 'valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: submit,
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
