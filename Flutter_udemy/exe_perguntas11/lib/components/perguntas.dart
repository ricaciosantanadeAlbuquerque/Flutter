import 'package:flutter/material.dart';

class Perguntas extends StatelessWidget {
  final String texto;

  const Perguntas({super.key, required this.texto});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(texto,
      style:const TextStyle(
        fontSize: 20
      ),),
    );
  }
}
