import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  const TransactionForm({super.key, required this.onSubmit});

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();

  submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }
    
    widget.onSubmit(titulo, valor); // se não for vazio ou 0 ou menor pode validar
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(children: [
        TextField(
          controller: title,
          onSubmitted:(_) => submit(),
          decoration: const InputDecoration(labelText: 'Valor'),
        ),
        TextField(
          controller: value,
          keyboardType:const TextInputType.numberWithOptions(decimal:true),
          onSubmitted:(_) => submit(),
          decoration: const InputDecoration(labelText: 'Valor (R\$)'),
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
        )
      ]),
    ));
  }
}
