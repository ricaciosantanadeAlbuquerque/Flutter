import 'package:consumo_dio_api11/src/view/home_app.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primaryColor: Colors.blue
      ),
      home: const HomeApp(),
    );
  }
}
