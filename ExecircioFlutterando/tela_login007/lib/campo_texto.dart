import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controle;
  const CampoTexto({
    super.key,
    required this.controle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controle,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        ),
    );
  }
}
