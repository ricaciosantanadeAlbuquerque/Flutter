import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();
  final value = TextEditingController();

  _subimit() {
    final String titulo = title.text;
    final double valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return; // se os dados forem inválidos  não será passado valores para a função onSubmit() e a instrução return  faz com que funcao seja encerrada nesse ponto
    }

    widget.onSubmit(titulo, valor); // passando valores para funcão
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        TextField(
          controller: title,
          onSubmitted:(_) => _subimit(),
          decoration:const InputDecoration(
            labelText:'Título',
          ),
        ),
        TextField(
          controller: value,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => _subimit(),
          decoration: const InputDecoration(
           labelText:'Valor(R\$)'
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: _subimit,
              child: Text(
                'Novo Transação',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ]),
    ),
    );
  }
}
