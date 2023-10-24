import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted});

  @override
  State<TransactionForm> createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();

  submite() {
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
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: title,
            onSubmitted:(_) => submite(),
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: value,
            onSubmitted:(_) => submite(),
            keyboardType:const TextInputType.numberWithOptions(decimal:true),
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => submite(),
                child: const Text('Nova Transação',
                style: TextStyle(
                  color:Colors.purple,
                ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
