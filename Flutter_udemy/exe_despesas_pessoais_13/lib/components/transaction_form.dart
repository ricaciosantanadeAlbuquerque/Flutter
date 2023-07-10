import 'package:flutter/material.dart';

class TransactionForme extends StatelessWidget {
  final titulo = TextEditingController();
  final valor = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForme({super.key, required this.onSubmit});

  _submit() {
    final title = titulo.text;
    final value = double.tryParse(valor.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value); // notifica o pai passando valores via parâmetro
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            controller: titulo,
            onSubmitted:(_) => _submit(),
            decoration: const InputDecoration(labelText: 'Título',
            ),
            
          ),
          TextField(
          keyboardType:const TextInputType.numberWithOptions(decimal:true),
          onSubmitted: (_) => _submit(),
          controller: valor, 
          decoration: const InputDecoration(
          labelText: 'valor (R\$)',
    
            ),
            ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: _submit,
              child: const Text(
                'Nova Transação',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
