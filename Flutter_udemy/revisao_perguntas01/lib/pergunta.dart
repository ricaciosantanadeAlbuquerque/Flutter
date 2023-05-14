import 'package:flutter/material.dart';

class Pergunta extends StatelessWidget {
  final String texto;

  const Pergunta({super.key, required this.texto});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        texto,
        style:const TextStyle(
          fontSize: 28
        )
      ),
    );
  }
}
