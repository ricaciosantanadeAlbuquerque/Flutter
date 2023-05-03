import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final void Function() funcao;
  const Botao({required this.funcao});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amberAccent,
        ),
        onPressed:funcao,
        child: const Text('CONVERTER'));
  }
}
