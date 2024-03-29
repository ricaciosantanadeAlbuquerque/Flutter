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

  submitte() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return; // não validamos
    }

    widget.onSubmitted(titulo, valor); // enviando os valores para o pai
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
              onSubmitted: (_) => submitte(),
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: value,
              onSubmitted: (_) => submitte(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'valor (R\$)'),
            ),
            Container(
              height:70,
              child: Row(children: [
                Text('Nenhuma Data selecionada !',
                style: Theme.of(context).textTheme.titleLarge,),
                TextButton(onPressed: (){},child:  Text('Selecionar Data',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),),)
              ],),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: 
              [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    submitte();
                  },
                  child: Text('Nova Transação',
                  style: Theme.of(context).textTheme.labelLarge
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
