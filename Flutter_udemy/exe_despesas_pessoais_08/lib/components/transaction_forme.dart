import 'package:flutter/material.dart';

class TransactionForme extends StatelessWidget {
  final titulo = TextEditingController();
  final value = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForme({super.key, required this.onSubmit});

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
                    /**
                     * final Titulo11 = titulo.text;
                    final valor = double.tryParse(value.text) ?? 0.0;
                     */
                    //onSubmit(titulo.text,value.text as double); estamos fazando converção de um atribulto de objeto, typecast não funciona 
                        onSubmit(titulo.text, double.tryParse(value.text)?? 0.0);
                  })
            ])
          ]),
        ));
  }
}
