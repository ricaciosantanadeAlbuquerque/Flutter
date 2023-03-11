import 'package:consumo_api_flutter03/Inicio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      primarySwatch:Colors.green,
      brightness: Brightness.light
    ),
    home: const Inicio()
    );
  }
}
