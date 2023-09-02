import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao08/cadastro.dart';
import 'package:revisao08/inicialApp.dart';
import 'controle.dart';
class MeuApp extends StatelessWidget{

  const MeuApp({super.key});

  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: Controle.instancia,
      builder: (context, child) {  
      return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Controle.instancia.verdade ? Brightness.dark : Brightness.light
      ),
      home: const InicialApp()
    );
    },);
  }
}