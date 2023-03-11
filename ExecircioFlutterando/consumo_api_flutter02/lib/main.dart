import 'package:flutter/material.dart';

import 'Inicio_App.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {

  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Colors.green,
        brightness:Brightness.light,
      ),
      home: const Inicio()
    );
  }
}
