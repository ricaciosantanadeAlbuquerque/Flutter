import 'package:flutter/material.dart';


class Questao extends StatelessWidget {

  final String texto; // atribulto da classe 

  const Questao({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(texto);
  }
}
