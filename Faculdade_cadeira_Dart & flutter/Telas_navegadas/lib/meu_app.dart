import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/gerente.dart';
import 'package:login/segunda_tela.dart';

import 'controlle.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:Controle.instancia,
      builder: (
        BuildContext context, Widget? child) { 
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness:Controle.instancia.troca ? Brightness.dark : Brightness.light), 
        home: const Gerente()
        );

     },);
  }
}
