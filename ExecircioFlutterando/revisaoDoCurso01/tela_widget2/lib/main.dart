import 'package:flutter/material.dart';
import 'package:tela_widget2/Tela22.dart';
import 'package:tela_widget2/controle.dart';
import 'package:tela_widget2/home_app.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Controle.controle,
        builder: (context, widget) {
          return MaterialApp(theme: ThemeData(primarySwatch: Colors.red, brightness: (Controle.controle.verdade) ? Brightness.dark : Brightness.light), 
          home: const HomeApp());
        });
  }
}
