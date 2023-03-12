import 'package:consumo_api_flutter05/home_App.dart';
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
        primarySwatch: Colors.green,
        brightness: Brightness.light
      ),
      home: const HomeApp()
      
    );
  }
}
