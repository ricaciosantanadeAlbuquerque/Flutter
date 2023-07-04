import 'package:flutter/material.dart';

class TransactionForme extends StatefulWidget {
  final void Function(String title, double value) onSubmit;

  const TransactionForme({super.key, required this.onSubmit});

  @override
  State<TransactionForme> createState() => _TransactionFormeState();
}

class _TransactionFormeState extends State<TransactionForme> {
  final title = TextEditingController();

  final value = TextEditingController();

  void submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      // se for vazio ou o valor for zero,  a estrutura return encerrará o método.
      return;
    }

    widget.onSubmit(titulo, valor);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                  controller: title,
                  onSubmitted: (value) => submit(),
                  decoration: const InputDecoration(
                    labelText: 'Título',
                  )),
              TextField(
                controller: value,
                onSubmitted: (value) => submit(),
                keyboardType: const TextInputType.numberWithOptions(decimal:  true),
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: submit,
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
