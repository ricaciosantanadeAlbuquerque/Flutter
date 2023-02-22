import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao/Tela1.dart';
import 'package:revisao/Tela2.dart';
import 'package:revisao/controle.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Controle.instancia,
        builder: (context, child) {
          return MaterialApp(
            theme:ThemeData(
              primarySwatch:Colors.red,
              brightness:Controle.instancia.logico ? Brightness.dark :Brightness.light
            ),
            initialRoute:"/",
            routes:{
              "/": (context) => Tela1(),
              "//":(context) => Tela2()
              }
          );
        });
  }
}
