import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  TextEditingController controle;

  Texto({super.key, required this.controle,});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controle,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Lonig',
          hintText: 'Login',
        ));
  }
}
