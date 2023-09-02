
import 'package:flutter/material.dart';
import 'package:revisao/home_page.dart';
import 'package:revisao/segunda_tela.dart';

import 'controle.dart';

class Meuapp extends StatelessWidget{
 const Meuapp({super.key});

 @override
 Widget build(BuildContext context){
  return AnimatedBuilder(
    animation:Controle.instancia,
    builder: (BuildContext context, Widget? child) {  
      return MaterialApp(
    theme:ThemeData(
      primarySwatch:Colors.blue,
      brightness:Controle.instancia.getVerdade ? Brightness.dark : Brightness.light
    ),
    initialRoute:"/",
      routes:{
        "/":(context) => const Home(),
        "tela2": (context) => const SegundaTela()
      }
  );
    },);
 }
}