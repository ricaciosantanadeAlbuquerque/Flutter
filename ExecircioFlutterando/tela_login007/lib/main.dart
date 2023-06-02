import 'package:flutter/material.dart';
import 'controle.dart';
import 'home_app.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {

  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Controle.instancia,
       builder:(context,_){
      return MaterialApp(
         theme:ThemeData(
          primarySwatch:Colors.red,
          brightness: Controle.instancia.valor ? Brightness.dark:Brightness.light
         ),
         home: const HomeApp()
    );
    });
  }
}
