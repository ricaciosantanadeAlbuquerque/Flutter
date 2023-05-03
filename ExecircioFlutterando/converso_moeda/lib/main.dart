import 'package:flutter/material.dart';

void main() => const MeuApp();

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.amber,
        brightness:Brightness.dark
      )
    );
  }
}
