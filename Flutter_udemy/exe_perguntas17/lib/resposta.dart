import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final void Function() onSelected;
  final String texto;

  const Resposta({super.key,required this.onSelected,required this.texto});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
