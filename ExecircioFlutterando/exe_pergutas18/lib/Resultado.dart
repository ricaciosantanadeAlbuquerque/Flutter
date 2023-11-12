import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int valorTotla;
  final void Function() onChanged;
  const Resultado({super.key, required this.valorTotla, required this.onChanged});

  String get farseResultado {
    if (valorTotla < 8) {
      return 'Parabéns !';
    } else if (valorTotla < 12) {
      return 'Você é bom !';
    } else if (valorTotla < 16) {
      return 'Impressionante !';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text( farseResultado),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: onChanged,
          child: const Text('Reset !'),
        ),
      ],
    );
  }
}
