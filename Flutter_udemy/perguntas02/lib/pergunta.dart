import 'package:flutter/material.dart';

class Pergunta extends StatelessWidget { // classe Imutável
  final String texto;

  const Pergunta({super.key,required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child:Center(
        child: Text(texto,
        style:const TextStyle(
          fontSize:28
        )),
      ),
    );
  }
}
