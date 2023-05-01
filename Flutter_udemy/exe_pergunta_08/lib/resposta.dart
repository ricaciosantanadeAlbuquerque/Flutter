import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() funcao;

  const Respostas({super.key, required this.texto, required this.funcao});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      child:ElevatedButton(
        style:ElevatedButton.styleFrom(
          backgroundColor:Colors.blue
        ),
        onPressed: funcao,
        child: Text(texto)
      )
    );
  }
}
