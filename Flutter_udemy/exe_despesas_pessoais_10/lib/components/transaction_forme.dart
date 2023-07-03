import 'package:flutter/material.dart';

class TransactionForme extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  final void Function(String title, double value) onSubmit;

  TransactionForme({super.key, required this.onSubmit});

   void submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text)?? 0.0;
    onSubmit(titulo,valor);
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
               keyboardType:const TextInputType.numberWithOptions(),
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
