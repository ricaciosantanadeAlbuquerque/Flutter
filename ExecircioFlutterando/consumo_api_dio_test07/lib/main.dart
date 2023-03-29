import 'package:consumo_api_dio_test07/src/home_app.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {

  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.red
      ),
      home: const HomeApp()
    );
  }
}
