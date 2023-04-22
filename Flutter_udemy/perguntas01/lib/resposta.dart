import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function()? p;
  const Resposta({super.key, required this.texto,required this.p});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8), 
        child: ElevatedButton(
        onPressed: p, 
        child:  Text(texto)
        )
        ),
    );
  }
}
