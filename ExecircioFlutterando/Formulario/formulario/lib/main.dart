import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulario/home_forme.dart';

void main() {
  runApp(const Formulario());
}

class Formulario extends StatelessWidget {
  const Formulario({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const HomeForme(),
    );
  }
}
