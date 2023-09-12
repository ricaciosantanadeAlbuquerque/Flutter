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

    if (titulo.isEmpty || valor <= 0) {
      return; // sai da função sem validar os dados
    }

    widget.onSubmitted(titulo,valor); // como os dados são válidos posso enviar ele para a classe pai que enviou a funcao
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
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal:true),
              controller: value,
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
