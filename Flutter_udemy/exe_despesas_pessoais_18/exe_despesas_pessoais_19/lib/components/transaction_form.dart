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
  final TextEditingController titulo = TextEditingController();
  final TextEditingController valor = TextEditingController();


  submitted() {
    final title = titulo.text;
    final value = double.tryParse(valor.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return; // morre aqui e não passa os dados para a função onSubmit()
    }

    widget.onSubmit(title, value); // significa que os dados são válidos
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
              controller: titulo,
              onSubmitted:(_) => submitted(),
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valor,
              onSubmitted:(_) => submitted(),
              keyboardType:const TextInputType.numberWithOptions(decimal:true),
              decoration: const InputDecoration(labelText: 'Valor(R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    //widget.onSubmit(titulo.text, double.tryParse(valor.text) ?? 0);
                    submitted();
                  },
                  child: const Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
