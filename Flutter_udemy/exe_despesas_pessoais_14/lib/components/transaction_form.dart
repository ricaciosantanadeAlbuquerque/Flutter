import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() {
    return TransactionFormState();
  }
  
}

class TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final valeu = TextEditingController();

  _Submit() {
    final titulo = title.text;
    final valor = double.tryParse(valeu.text) ?? 0.0;
    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmit(titulo, valor);

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: title,
            onSubmitted:(_) => _Submit(),
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: valeu,
            keyboardType:const TextInputType.numberWithOptions(decimal:true),
            onSubmitted:(_) => _Submit(),
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _Submit,
                child: const Text(
                  'Nova transação',
                  style: TextStyle(
                    color: Colors.purple,
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
