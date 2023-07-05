import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  _submit() {
    final titulo = title.text;
    final valor = double.tryParse(value.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    onSubmit(titulo, valor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5,
      child: Padding(
        padding:const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller:title,
            onSubmitted:(_) => _submit(),
            decoration:const InputDecoration(
              labelText:'Título'
            )
          ),
          TextField(
            keyboardType:const TextInputType.numberWithOptions(decimal:true),
            controller: value,
            onSubmitted:(_) => _submit(),
            decoration: const InputDecoration(
              labelText:'Valor (R\$)'
            )
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children:[
              TextButton(
              onPressed: _submit,
              child: const Text(
                'Nova Transação',
                style: TextStyle(
                  color:Colors.purple
                ),),
            ),
            ] 
          ),
        ]),
      ),
    );
  }
}
