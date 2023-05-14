import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final void Function() funcao;
  const Botao({super.key,required this.funcao,required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcao,
       child: Text(texto),
       );
  }
}
