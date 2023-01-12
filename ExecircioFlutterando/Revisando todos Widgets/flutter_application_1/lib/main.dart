import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Meu_app.dart';

import 'Tela2.dart';
import 'controle_app.dart';

void main(List<String> args) {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Controle.instancia,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: 
            Colors.red, brightness: 
            Controle.instancia.valor ? Brightness.dark : Brightness.light),
            initialRoute:"/", 
             routes:{"/":(context)=> const MeuAppInicio(),
            'p':(context)=>const Tela2()}
        );
      },
    );
  }
}
