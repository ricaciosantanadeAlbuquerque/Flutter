import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final void Function() funcao;
  const Botao({super.key,required this.funcao});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed:funcao,
          child: const Text('Entrar'),
        ));
  }
}
