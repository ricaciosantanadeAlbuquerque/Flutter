import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;
  const Questao({super.key,required this.texto});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Text(texto,
      style:const TextStyle(
        fontSize:28,
      )
      )
    );
  }
}
