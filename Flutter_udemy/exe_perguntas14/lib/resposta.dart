import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected2;

  const Resposta({super.key, required this.texto, required this.onSelected2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelected2,
        child: Text(texto),
      ),
    );
  }
}
