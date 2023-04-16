import 'package:flutter/material.dart';
import 'package:tela_login/login.dart';
import 'package:tela_login/tela2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.red
      ),
      home: const HomeApp()
    );
  }
}
