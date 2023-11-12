import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressed;
  const Resposta({super.key,required this.texto,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:double.infinity,
        child: ElevatedButton(
              onPressed: onPressed,
              child: Text(texto),
            ),
    );
  }
}
