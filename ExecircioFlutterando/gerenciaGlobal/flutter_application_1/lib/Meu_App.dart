import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controle.dart';
import 'package:flutter_application_1/Login_page.dart';
import 'package:flutter_application_1/Segunda_tela.dart';

class MeuApp extends StatelessWidget{
  @override
 Widget build(BuildContext context){
   return AnimatedBuilder(
    animation: Controle.instancia,
    builder: (BuildContext context, Widget? child) {
    return MaterialApp(
    theme:ThemeData(
      primarySwatch:Colors.red,
      brightness: Controle.instancia.valor ? Brightness.dark:Brightness.light,
    ),
    home:const Login()
   );
     },);
  }
}