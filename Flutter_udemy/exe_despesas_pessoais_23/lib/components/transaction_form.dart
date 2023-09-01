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
    /** Caso os valores não seja válidos, ele entra na condição e sai da função  sem passar os  valores para o pai  através de onSubmitted() */
    if (titulo.isEmpty || valor <= 0) {
      return; // sai da funcao;
    }

    widget.onSubmitted(titulo, valor); // passa valores para o pai desta classe via parâmetro
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
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
              decoration: const InputDecoration(
                labelText: 'Valor(R\$)',
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  submitted();
                },
                child: const Text(
                  'Nova Transação',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
