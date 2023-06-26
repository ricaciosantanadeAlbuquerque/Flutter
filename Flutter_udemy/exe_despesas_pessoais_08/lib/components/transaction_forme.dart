import 'package:flutter/material.dart';

class TransactionForme extends StatelessWidget {
  final titulo = TextEditingController();
  final value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            TextField(controller: titulo, decoration: const InputDecoration(labelText: 'Título')),
            TextField(controller: value, decoration: const InputDecoration(labelText: 'Valor (R\$)')),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                  child: const Text('Nova Transferência', style: TextStyle(color: Colors.purple)),
                  onPressed: () {
                    print(titulo.text);
                    print(value.text);
                  })
            ])
          ]),
        ));
  }
}
