import 'package:flutter/material.dart';

class Questao extends StatelessWidget { // só pode ser rederizado se os valores dos argumentos passados mudarem
  final String texto;

  const Questao({super.key, required this.texto});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin:const EdgeInsets.all(10),
      child: Center(
        child: Text(texto,
        style:const TextStyle(
          fontSize:28
        )
        ),
      )
    );
  }
}
