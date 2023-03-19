import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext constext) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.red
      ),
    );
  }
}
