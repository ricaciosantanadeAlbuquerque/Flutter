import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Texto2 extends StatelessWidget {
  TextEditingController controle;

  Texto2({super.key, required this.controle});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controle,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Senha',
          hintText: 'Senha',
        ),
        );
  }
}
