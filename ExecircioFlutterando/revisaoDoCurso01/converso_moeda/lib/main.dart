import 'package:converso_moeda/app/view/home_App.dart';
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
        primarySwatch:Colors.yellow,
        brightness:Brightness.dark
      ),
      home:const HomeApp()
    );
  }
}
