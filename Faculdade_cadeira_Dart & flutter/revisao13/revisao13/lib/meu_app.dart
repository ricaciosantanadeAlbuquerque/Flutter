import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao13/controle.dart';
import 'package:revisao13/inicial.dart';
import 'package:revisao13/tela2.dart';

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: Controle.instancia,
      builder: (BuildContext context, Widget? child) {  
        return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.green,
        brightness: Controle.instancia.verdade ? Brightness.dark : Brightness.light
      ),
      initialRoute:"/", // rota primaria
      routes:{
        "/" :(context) => const Inicio(),
        "tela2":(context) => const Tela2()
      }
    );
      },);
  }
}