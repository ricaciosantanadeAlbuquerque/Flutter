import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final void Function() onSubmitted;

  final String texto;

  const Resposta({super.key, required this.onSubmitted, required this.texto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      child:  ElevatedButton(
        style:ElevatedButton.styleFrom(backgroundColor:Colors.blue),
        onPressed: onSubmitted,
        child: Text(texto),
      ),
    );
  }
}
