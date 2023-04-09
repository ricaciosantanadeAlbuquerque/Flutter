import 'package:flutter/material.dart';
import 'package:tela_widget3/Tela2.dart';
import 'package:tela_widget3/controle.dart';
import 'package:tela_widget3/home_app.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: Controle.instancia, builder: (context, child) {
      return MaterialApp(theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: (Controle.instancia.mudar) ? Brightness.dark : Brightness.light,
      ), home: const HomeApp());
    });
  }
}
