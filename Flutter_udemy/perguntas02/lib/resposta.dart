import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() funcao;

  const Resposta({super.key, required this.texto, required this.funcao});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width:double.infinity,
       child:ElevatedButton(onPressed:funcao,
       child:Text(texto),
       )
    );
  }
}
