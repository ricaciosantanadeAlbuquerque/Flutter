import 'package:consumo_api_flutter10/src/home_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {

  const MeuApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.amber
      ),
      home: const HomeApp()
    );
  }
}
