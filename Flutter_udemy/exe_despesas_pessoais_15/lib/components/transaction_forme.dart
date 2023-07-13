import 'package:flutter/material.dart';
/**
 * A passagem dos dados será feita por comunicação indireta, através de uma função passada via construtor,  classe pai passará uma  função para que a sub classe, a classe filha que tem os dados passe esses dados para o pai via parâmetro.
 */
class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmitted;

  const TransactionForm({super.key, required this.onSubmitted}); 
  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final titulo = TextEditingController();

  final valor = TextEditingController();

  submit() {
    final title = titulo.text;
    final value = double.tryParse(valor.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      // caso os  valores sejam vazios  ou 0 ou menor qe zero  não será submetido
      return;
    }
    // se chegar neste ponto é porque o valor nem é vazio nem é nulo

    widget.onSubmitted(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(controller: titulo, 
            onSubmitted:(_) => submit(),
            decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              keyboardType:const TextInputType.numberWithOptions(decimal:true),
              onSubmitted: (_) => submit(),
              controller: valor,
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(children: [
              TextButton(
                onPressed: submit,
                child: const Text('Nova Transação'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
