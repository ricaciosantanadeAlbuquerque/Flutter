import 'package:flutter/material.dart';

// classe Imutável 
class Questao extends StatelessWidget {

  final String texto; // atribulto da classe 

  const Questao({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin:const EdgeInsets.all(10),
      child: Text(
        texto,
        style:const TextStyle(
          fontSize:28,
        ),
        textAlign:TextAlign.center
        )
      );
  }
}
