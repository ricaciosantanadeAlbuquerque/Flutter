import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  
  final String texto;

  const Questao({super.key,required this.texto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Text(texto,
        style: const TextStyle(
          fontSize:28,
        ),
        ),
      ),
    );
  }
}
