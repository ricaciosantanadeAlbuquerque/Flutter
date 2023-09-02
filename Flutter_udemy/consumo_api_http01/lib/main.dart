import 'package:consumo_api_http01/src/view/homeapp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.blue
      ),
      home: const HomeApp()
    );
  }
}
