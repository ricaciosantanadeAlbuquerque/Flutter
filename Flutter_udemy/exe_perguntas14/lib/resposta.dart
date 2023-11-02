import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  const Resposta({super.key, required this.texto, required this.onSelected});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
