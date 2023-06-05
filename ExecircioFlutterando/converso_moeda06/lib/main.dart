import 'package:converso_moeda06/app/view/home_app.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        brightness:Brightness.dark
      ),
      home:const HomeApp()
    );
  }
}
